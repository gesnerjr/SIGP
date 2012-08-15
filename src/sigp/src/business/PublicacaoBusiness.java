package sigp.src.business;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PublicacaoBusiness {
	
	/* public:
	 * 	 PATH/id/
	 * 	 PATH/id/presentation/
	 * 	 PATH/id/paper/
	 * private:
	 * 	 PRIVATE_PATH/id/
	 */

	private static final String PATH = "/sigpfiles/public/publications/";
	private static final String PRIVATE_PATH = "/sigpfiles/private/publications/";

	public PublicacaoBusiness(){
	}
	
	private String getPath(Long id, String file){
		return PATH + id + "/" + file;
	}
	
	private String getPrivatePath(Long id, String file){
		return PRIVATE_PATH + id + "/" + file;
	}
	
	private String getPathPaper(Long id){
		return PATH + id + "/paper/";
	}
	
	private String getPathPresentation(Long id){
		return PATH + id + "/presentation/";
	}
	
	public void savePdf(Long id, UploadedFile pdf) throws IOException {
		emptyDir(getPathPaper(id));
		saveFile(pdf, getPathPaper(id) + pdf.getFileName());
	}
	
	public void savePresentation(Long id, UploadedFile f) throws IOException {
		emptyDir(getPathPresentation(id));
		saveFile(f, getPathPresentation(id) + f.getFileName());
	}
	
	public void savePublicFile(Long id, UploadedFile f) throws IOException {
		saveFile(f, getPath(id,f.getFileName()));
	}
	
	public void savePrivateFile(Long id, UploadedFile f) throws IOException {
		saveFile(f, getPrivatePath(id,f.getFileName()));
	}
	
	private void saveFile(UploadedFile f, String path) throws IOException{
		if (f != null) {
			try {
				IOUtils.copy(f.getFile(), new FileOutputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				throw new FileNotFoundException("Arquivo não encontrado!");
			} catch (IOException e) {
				e.printStackTrace();
				throw new IOException("Não foi possível enviar o arquivo!");
			}
		}
	}


	public void deletePdf(Long id) {
		emptyDir(getPathPaper(id));
	}
	
	public void deletePresentation(Long id) {
		emptyDir(getPathPresentation(id));
	}
	
	public void deletePublicFile(Long id, String file){
		deleteFile(getPath(id, file));
	}
	
	public void deletePrivateFile(Long id, String file){
		deleteFile(getPrivatePath(id, file));
	}
	
	public void deleteFile(String path){
		File file = new File(path);
		if (file.exists() && file.isFile()){
			file.delete();
		}
	}
	
	private void emptyDir(String path){
		File dir = new File(path);
		if (dir.exists()){
			for (File f: dir.listFiles()) f.delete();
		} else {
			dir.mkdir();
		}
	}
	
	public File downloadPdf(Long id) {
		return getFirst(getPathPaper(id));
	}
	
	public File downloadPresentation(Long id) {
		return getFirst(getPathPresentation(id));
	}
	
	private File getFirst(String path){
		File dir = new File(path);
		if (dir.exists()){
			File[] f = dir.listFiles();
			if (f.length != 0) return f[0];
		}
		return null;
	}
	
	List<String> getFiles(Long id){
		List<String> fileList = new ArrayList<String>();
		File dir = new File(getPath(id,""));
		for (File f: dir.listFiles()){
			if (f.isFile()) fileList.add(f.getName());
		}
		return fileList;
	}

	public File downloadFile(Long id, String f) {
		if (f == null) return null;
		
		File file = new File(getPath(id, f));
		if (file.exists() && file.isFile()){
			return file;
		}
		
		return null;
	}

}