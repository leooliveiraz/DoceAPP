package doce.infra;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {

	@Autowired
	private HttpServletRequest request;

	public String write(String baseFolder, MultipartFile file) {
		try {
			String realPath = request.getServletContext().getRealPath("/"+baseFolder);
			String path = realPath + "/" + file.getOriginalFilename();
			file.transferTo(new File(path));

			return baseFolder + "/" + file.getOriginalFilename();
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e);
		}
	}

	public File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException 
	{
	    File convFile = new File(multipart.getOriginalFilename());
	    convFile.createNewFile(); 
	    FileOutputStream fos = new FileOutputStream(convFile); 
	    fos.write(multipart.getBytes());
	    fos.close(); 
	    return convFile;
	}
	
	public String encodeFileToBase64Binary(File file) throws IOException {
		String encodedString = DatatypeConverter.printBase64Binary(getBytes(file));
		return encodedString;
	}
	
	public byte[] getBytes(File file) {
	     int             len     = (int)file.length();  
	      byte[]          sendBuf = new byte[len];
	      FileInputStream inFile  = null;
	      try {
	         inFile = new FileInputStream(file);         
	         inFile.read(sendBuf, 0, len);  
	      } catch (FileNotFoundException fnfex) {
	      } catch (IOException ioex) {
	      }
	 return sendBuf;
	}

}









