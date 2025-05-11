/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p3;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

/**
 *
 * @author acer
 */
public class HMAC {
    // Method to generate HMAC for a given message and secret key
    public static String generateHMAC(String message, String secretKey) throws Exception {
        try {
            // Specify the HMAC algorithm (SHA-256 in this case)
            Mac mac = Mac.getInstance("HmacSHA256");
            SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes(), "HmacSHA256");
            mac.init(secretKeySpec);

            // Compute HMAC
            byte[] rawHMAC = mac.doFinal(message.getBytes());

            // Return HMAC as a Base64 encoded string
            return Base64.getEncoder().encodeToString(rawHMAC);
        } catch (Exception e) {
            throw new Exception("Error generating HMAC: " + e.getMessage());
        }
    }

    // Method to verify if the given HMAC matches the expected HMAC
    public static boolean verifyHMAC(String message, String secretKey, String expectedHMAC) throws Exception {
        String generatedHMAC = generateHMAC(message, secretKey);
        return generatedHMAC.equals(expectedHMAC);
    }
}
