package model;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class PasswordEncryption {
    
    // Constants for the encryption algorithm, tag length, IV length, salt length, and character encoding
    private static final String ENCRYPT_ALGO = "AES/GCM/NoPadding";

    private static final int TAG_LENGTH_BIT = 128; // must be one of {128, 120, 112, 104, 96}
    private static final int IV_LENGTH_BYTE = 12;
    private static final int SALT_LENGTH_BYTE = 16;
    private static final Charset UTF_8 = StandardCharsets.UTF_8;
   
    
    // Generate a random nonce (number used once) of the specified length
    public static byte[] getRandomNonce(int numBytes) {
        byte[] nonce = new byte[numBytes];
        new SecureRandom().nextBytes(nonce);
        return nonce;
    }

    // Generate an AES secret key with the specified key size
    public static SecretKey getAESKey(int keysize) throws NoSuchAlgorithmException {
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");
        keyGen.init(keysize, SecureRandom.getInstanceStrong());
        return keyGen.generateKey();
    }

    // Derive an AES secret key from a password and salt using PBKDF2WithHmacSHA256
    public static SecretKey getAESKeyFromPassword(char[] password, byte[] salt){
               try {
                   SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
                   // iterationCount = 65536
                   // keyLength = 256
                   KeySpec spec = new PBEKeySpec(password, salt, 65536, 256);
                   SecretKey secret = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");
                   return secret;
               } catch (NoSuchAlgorithmException ex) {
                   Logger.getLogger(PasswordEncryption.class.getName()).log(Level.SEVERE, null, ex);
               } catch (InvalidKeySpecException ex) {
                   Logger.getLogger(PasswordEncryption.class.getName()).log(Level.SEVERE, null, ex);
               }
               return null;
    }

    // Encrypt the given password using the provided email
    public static String encrypt(String email, String password){
        try {
            // Generate a random salt and initialization vector (IV)
            // 16 bytes salt
            byte[] salt = getRandomNonce(SALT_LENGTH_BYTE);
        
            // GCM recommended 12 bytes iv?
            byte[] iv = getRandomNonce(IV_LENGTH_BYTE);
        
            // Derive the AES key from the password and salt
            SecretKey aesKeyFromPassword = getAESKeyFromPassword(email.toCharArray(), salt);
        
            
            // Initialize the AES cipher in encrypt mode with the key and GCM parameters
            Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
            // ASE-GCM needs GCMParameterSpec
            cipher.init(Cipher.ENCRYPT_MODE, aesKeyFromPassword, new GCMParameterSpec(TAG_LENGTH_BIT, iv));
         // Encrypt the password
            byte[] cipherText = cipher.doFinal(password.getBytes());
        
            // Combine the IV, salt, and ciphertext into a single byte array
            byte[] cipherTextWithIvSalt = ByteBuffer.allocate(iv.length + salt.length + cipherText.length)
                    .put(iv)
                    .put(salt)
                    .put(cipherText)
                    .array();
        
            // Return the encrypted password as a Base64-encoded string
            return Base64.getEncoder().encodeToString(cipherTextWithIvSalt);
        }catch(Exception ex) {
            return null;
        }

    }

    
    // Decrypt the given encrypted password using the provided email
    public static String decrypt(String encryptedPassword, String email) {
        try {
            // Decode the Base64-encoded encrypted password
            byte[] decode = Base64.getDecoder().decode(encryptedPassword.getBytes(UTF_8));
    
            // Extract the IV, salt, and ciphertext from the decoded bytes
            ByteBuffer bb = ByteBuffer.wrap(decode);
    
            byte[] iv = new byte[IV_LENGTH_BYTE];
            bb.get(iv);
    
            byte[] salt = new byte[SALT_LENGTH_BYTE];
            bb.get(salt);
    
            byte[] cipherText = new byte[bb.remaining()];
            bb.get(cipherText);
    

            
            // Derive the AES key from the password and salt
            SecretKey aesKeyFromPassword = PasswordEncryption.getAESKeyFromPassword(email.toCharArray(), salt);
            
            
            // Initialize the AES cipher in decrypt mode with the key and GCM parameters
            Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
    
            cipher.init(Cipher.DECRYPT_MODE, aesKeyFromPassword, new GCMParameterSpec(TAG_LENGTH_BIT, iv));
    
            
            // Decrypt the ciphertext
            byte[] plainText = cipher.doFinal(cipherText);
        
            // Return the decrypted password as a string
            return new String(plainText, UTF_8);
        }catch(Exception ex) {
            return null;
        }

    }
 
}
