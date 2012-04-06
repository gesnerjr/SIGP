package sigp.src.business;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.io.IOUtils;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PublicacaoBusiness {

	private static final String PATH_PDF = "/sigpfiles/pub";

	public PublicacaoBusiness(){
	}

	public void salvarPdf(Long id, UploadedFile pdf) throws IOException {
		if (pdf != null) {
			try {
				IOUtils.copy(pdf.getFile(), new FileOutputStream(new File(PATH_PDF + "/" + id + ".pdf")));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				throw new FileNotFoundException("Arquivo não encontrado!");
			} catch (IOException e) {
				e.printStackTrace();
				throw new IOException("Não foi possível enviar o arquivo!");
			}
		}
	}

	public File downloadPdf(Long id) {
		File file = new File(PATH_PDF + "/" + id + ".pdf");
		return (file.exists()) ? file : null;
	}

	public void removerPdf(Long id) {
		File file = new File(PATH_PDF + "/" + id + ".pdf");

		if (file.exists()) {
			file.delete();
		}
	}

}