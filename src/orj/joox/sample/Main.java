package orj.joox.sample;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class Main extends JFrame implements ActionListener {

	private JButton btnBrowseAPK;
	private JButton btnBrowseKeystore;
	private JButton btnChoose;
	private JFileChooser fc;
	private String inputAPKPath, keystorePath, keystorePass, keystoreAlias, outputApkPath;
	private JTextArea textPane;

	public Main() {
		fc = new JFileChooser();
		getContentPane().setLayout(null);

		JLabel lblChooseApkFile = new JLabel("Choose APK File");
		lblChooseApkFile.setBounds(6, 2, 183, 39);
		getContentPane().add(lblChooseApkFile);
		txtEdtapkfile = new JTextField();
		txtEdtapkfile.setBounds(183, 2, 237, 39);
		getContentPane().add(txtEdtapkfile);
		txtEdtapkfile.setColumns(10);

		btnBrowseAPK = new JButton("Browse...");
		btnBrowseAPK.setBounds(432, 3, 147, 39);
		btnBrowseAPK.addActionListener(this);
		getContentPane().add(btnBrowseAPK);

		JLabel lblChooseKeystore = new JLabel("Choose keystore");
		lblChooseKeystore.setBounds(6, 41, 183, 39);
		getContentPane().add(lblChooseKeystore);

		txtChooseKeystore = new JTextField();
		txtChooseKeystore.setBounds(183, 41, 237, 39);
		getContentPane().add(txtChooseKeystore);
		txtChooseKeystore.setColumns(10);

		btnBrowseKeystore = new JButton("Browse...");
		btnBrowseKeystore.setBounds(432, 42, 147, 39);
		btnBrowseKeystore.addActionListener(this);
		getContentPane().add(btnBrowseKeystore);

		JLabel lblKeystorePass = new JLabel("Keystore Pass");
		lblKeystorePass.setBounds(6, 80, 183, 39);
		getContentPane().add(lblKeystorePass);

		txtKeystorePass = new JTextField();
		txtKeystorePass.setBounds(183, 80, 237, 39);
		getContentPane().add(txtKeystorePass);
		txtKeystorePass.setColumns(10);
		txtKeystorePass.setText("123465@appota");

		label = new JLabel("");
		label.setBounds(366, 80, 183, 39);
		getContentPane().add(label);

		JLabel lblKeystoreAlias = new JLabel("Keystore Alias");
		lblKeystoreAlias.setBounds(6, 119, 183, 39);
		getContentPane().add(lblKeystoreAlias);

		txtKeystoreAlias = new JTextField();
		txtKeystoreAlias.setBounds(183, 119, 237, 39);
		getContentPane().add(txtKeystoreAlias);
		txtKeystoreAlias.setColumns(10);
		txtKeystoreAlias.setText("appota");

		label_1 = new JLabel("");
		label_1.setBounds(366, 119, 183, 39);
		getContentPane().add(label_1);

		JLabel lblOutputFile = new JLabel("Output file");
		lblOutputFile.setBounds(6, 158, 183, 39);
		getContentPane().add(lblOutputFile);

		txtOutputFile = new JTextField();
		txtOutputFile.setBounds(183, 158, 237, 39);
		getContentPane().add(txtOutputFile);
		txtOutputFile.setColumns(10);

		btnChoose = new JButton("Choose...");
		btnChoose.setBounds(432, 159, 147, 39);
		btnChoose.addActionListener(this);
		getContentPane().add(btnChoose);

		label_2 = new JLabel("");
		label_2.setBounds(0, 197, 183, 39);
		getContentPane().add(label_2);

		btnRock = new JButton("Rock!");
		btnRock.addActionListener(this);
		btnRock.setBounds(183, 251, 183, 39);

		getContentPane().add(btnRock);

		label_3 = new JLabel("");
		label_3.setBounds(366, 197, 183, 39);
		getContentPane().add(label_3);

		textPane = new JTextArea();
		textPane.setBounds(10, 302, 569, 207);
		JScrollPane scrollPane = new JScrollPane(textPane);
		scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
		scrollPane.setBounds(10, 302, 569, 207);
		textPane.setEditable(false);
		getContentPane().add(scrollPane);
	}

	private static String mainClassName;
	private static Node application;
	private static Element rootElement;
	private static Node oldMainActivityNode;
	private static String packageName;
	private static String projectName;
	private static String afterBuildApkName;

	private JTextField txtEdtapkfile;
	private JTextField txtChooseKeystore;
	private JTextField txtKeystorePass;
	private JTextField txtKeystoreAlias;
	private JTextField txtOutputFile;
	private JButton btnRock;
	private JLabel label;
	private JLabel label_1;
	private JLabel label_2;
	private JLabel label_3;

	public static void main(String[] args) {
		Main main = new Main();
		main.setSize(586, 537);
		main.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		main.setVisible(true);
	}

	// private static void unzipApk(String path) {
	// Runtime rt = Runtime.getRuntime();
	// try {
	// Process pr = rt.exec("chmod a+x apktool");
	// pr.waitFor();
	// pr = rt.exec("./apktool if " + path);
	// pr.waitFor();
	// pr = rt.exec("./apktool d " + path);
	// pr.waitFor();
	// } catch (IOException e) {
	// e.printStackTrace();
	// } catch (InterruptedException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// }

	private void digApkFile(String filePath) {
		ProcessBuilder ps = new ProcessBuilder("chmod", "a+x", "apktool");
		ps.redirectErrorStream(true);
		Process pr;
		try {
			pr = ps.start();
			pr.waitFor();
			ps = new ProcessBuilder("./apktool", "if", filePath);
			pr = ps.start();
			pr.waitFor();
			ps = new ProcessBuilder("./apktool", "d", filePath, "-o", projectName);
			pr = ps.start();
			BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				// System.out.println(line);
				textPane.append(line + "\n");
			}
			pr.waitFor();
			in.close();
			// System.out.println("dig apk finished");
			textPane.append("dig apk finished" + "\n");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	private void buildApk(String path) {
		ProcessBuilder ps = new ProcessBuilder("./apktool", "b", path);
		ps.redirectErrorStream(true);
		Process pr;
		try {
			pr = ps.start();
			BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				// System.out.println(line);
				textPane.append(line + "\n");
			}
			pr.waitFor();
			in.close();
			// System.out.println("build apk finished");
			textPane.append("build apk finished" + "\n");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	private static void addPermissions(Document document) {
		List<String> permissionList = new ArrayList<String>();
		NodeList usePermission = rootElement.getElementsByTagName("uses-permission");
		for (int i = 0; i < usePermission.getLength(); i++) {
			Node permissionNode = usePermission.item(i);
			NamedNodeMap attr = permissionNode.getAttributes();
			Node nodeAttr = attr.getNamedItem("android:name");
			permissionList.add(nodeAttr.getNodeValue());
		}
		if (!permissionList.contains("android.permission.INTERNET")) {
			rootElement.appendChild(getPermissionNode(document, "android.permission.INTERNET"));
		}
		if (!permissionList.contains("android.permission.ACCESS_NETWORK_STATE")) {
			rootElement.appendChild(getPermissionNode(document, "android.permission.ACCESS_NETWORK_STATE"));
		}
	}

	private static Node getPermissionNode(Document document, String permission) {
		Element element = document.createElement("uses-permission");
		element.setAttribute("android:name", permission);
		return element;
	}

	private void replaceMainActivity(Document document) {
		boolean hasAdsActivity = false;
		boolean hasGPSMedaData = false;
		NodeList activity = rootElement.getElementsByTagName("activity");
		NodeList metaData = rootElement.getElementsByTagName("meta-data");
		for (int k = 0; k < metaData.getLength(); k++) {
			Node metaDataNode = metaData.item(k);
			if (metaDataNode.getAttributes().getNamedItem("android:name").equals("com.google.android.gms.version")) {
				hasGPSMedaData = true;
				break;
			}
		}
		for (int i = 0; i < activity.getLength(); i++) {
			Node activityNode = activity.item(i);
			if (activityNode.getAttributes().getNamedItem("android:name").equals("com.google.android.gms.ads.AdActivity")) {
				hasAdsActivity = true;
				break;
			}
		}
		for (int i = 0; i < activity.getLength(); i++) {
			Node activityNode = activity.item(i);
			NodeList intentFilter = activityNode.getChildNodes();
			for (int j = 0; j < intentFilter.getLength(); j++) {
				if (intentFilter.item(j).getNodeName().equals("intent-filter")) {
					Node action = intentFilter.item(j).getChildNodes().item(1);
					Node category = intentFilter.item(j).getChildNodes().item(3);
					if (action == null || category == null) {
						continue;
					}
					if (action.getNodeName().equals("action")) {
						NamedNodeMap attr = action.getAttributes();
						Node androidName = attr.getNamedItem("android:name");
						Node androidCategory = category.getAttributes().getNamedItem("android:name");
						if (androidName.getNodeValue().equals("android.intent.action.MAIN") && androidCategory.getNodeValue().equals("android.intent.category.LAUNCHER")) {
							oldMainActivityNode = activityNode.cloneNode(true);
							mainClassName = oldMainActivityNode.getAttributes().getNamedItem("android:name").getNodeValue();
							activityNode.getParentNode().removeChild(activityNode);
							break;
						}
					}
				}
			}
		}
		application.appendChild(getMainActivityNode(document));
		if (!hasAdsActivity) {
			application.appendChild(getAdsActivityNode(document));
		}
		NodeList intentFilter = oldMainActivityNode.getChildNodes();
		oldMainActivityNode.removeChild(intentFilter.item(1));
		application.appendChild(oldMainActivityNode);
		if (!hasGPSMedaData) {
			application.appendChild(getMetaDataNode(document));
		}
		int dotCount = mainClassName.length() - mainClassName.replace(".", "").length();
		// System.out.println(dotCount);
		textPane.append(dotCount + "\n");
		if (dotCount <= 1) {
			mainClassName = packageName + mainClassName;
		}
		// System.out.println(mainClassName);
		textPane.append(mainClassName + "\n");
	}

	private static Node getMainActivityNode(Document document) {
		Element element = document.createElement("activity");
		element.setAttribute("android:name", "com.admobvn.inject.AdmobInject");
		element.setAttribute("android:configChanges", "orientation|screenSize|keyboardHidden");

		Element intentFilter = document.createElement("intent-filter");
		Element action = document.createElement("action");
		action.setAttribute("android:name", "android.intent.action.MAIN");
		Element category = document.createElement("category");
		category.setAttribute("android:name", "android.intent.category.LAUNCHER");
		intentFilter.appendChild(action);
		intentFilter.appendChild(category);
		element.appendChild(intentFilter);
		return element;
	}

	private static Node getAdsActivityNode(Document document) {
		Element element = document.createElement("activity");
		element.setAttribute("android:name", "com.google.android.gms.ads.AdActivity");
		element.setAttribute("android:configChanges", "keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize");
		element.setAttribute("android:theme", "@android:style/Theme.Translucent");
		return element;
	}

	private static Node getMetaDataNode(Document document) {
		Element element = document.createElement("meta-data");
		element.setAttribute("android:name", "com.google.android.gms.version");
		element.setAttribute("android:value", "6111000");
		return element;
	}

	private static void writeToFile(Document document) {
		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer;
		try {
			transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(document);
			StreamResult result = new StreamResult(new File(projectName + "/AndroidManifest.xml"));
			transformer.transform(source, result);
		} catch (TransformerConfigurationException e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		}
	}

	private static void replaceMainActivitySmali() {
		StringBuilder sb = new StringBuilder();
		boolean doDiscardNl = false;
		String content = null;
		try {
			File file = new File(projectName + "/smali/com/admobvn/inject/AdmobInject.smali");
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			int i;
			while (0 <= (i = br.read())) {
				if (i == '\n') {
					if (doDiscardNl) {
						doDiscardNl = false;
					} else {
						sb.append((char) '\n');
					}
				} else {
					doDiscardNl = false;
					sb.append((char) i);
					if (i == '\r') {
						doDiscardNl = true;
					}
				}
			}
			if (sb.toString().contains("clazzName")) {
				content = sb.toString().replace("clazzName", mainClassName);
			}
			fr.close();
			br.close();
			FileWriter fw = new FileWriter(file);
			BufferedWriter out = new BufferedWriter(fw);
			// for (String s : lines)
			out.write(content);
			out.flush();
			out.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	private static String readFile(String file) {
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(file);
			BufferedReader reader = new BufferedReader(new InputStreamReader(fin));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
			return sb.toString();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fin.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static void copyFolder(File src, File dest) throws IOException {

		if (src.isDirectory()) {

			// if directory not exists, create it
			if (!dest.exists()) {
				dest.mkdir();
				// System.out.println("Directory copied from " + src + "  to " +
				// dest);
			}

			// list all the directory contents
			String files[] = src.list();

			for (String file : files) {
				// construct the src and dest file structure
				File srcFile = new File(src, file);
				File destFile = new File(dest, file);
				// recursive copy
				copyFolder(srcFile, destFile);
			}

		} else {
			// if file, then copy it
			// Use bytes stream to support all file types
			InputStream in = new FileInputStream(src);
			OutputStream out = new FileOutputStream(dest);

			byte[] buffer = new byte[1024];

			int length;
			// copy the file content in bytes
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}

			in.close();
			out.close();
			// System.out.println("File copied from " + src + " to " + dest);
		}
	}

	public static void writeToFile(String data, String fileName) {
		File f = new File(fileName);
		BufferedOutputStream bos;
		try {
			bos = new BufferedOutputStream(new FileOutputStream(f));
			bos.write(data.getBytes());
			bos.flush();
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void signApk(String path) {
		ProcessBuilder ps = new ProcessBuilder("chmod", "a+x", "apk-resigner.sh");
		ps.redirectErrorStream(true);
		Process pr;
		try {
			pr = ps.start();
			pr.waitFor();
			keystorePass = txtKeystorePass.getText();
			keystoreAlias = txtKeystoreAlias.getText();
			ps = new ProcessBuilder("./apk-resigner.sh", path, keystorePath, keystorePass, keystoreAlias, outputApkPath);
			pr = ps.start();
			BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				// System.out.println(line);
				textPane.append(line + "\n");
			}
			pr.waitFor();
			in.close();
			// System.out.println("sign apk finished");
			textPane.append("sign apk finished" + "\n");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if (e.getSource() == btnBrowseAPK) {
			fc.setFileSelectionMode(JFileChooser.FILES_ONLY);
			FileNameExtensionFilter filter = new FileNameExtensionFilter("APK FILES", "apk");
			fc.setFileFilter(filter);
			int returnVal = fc.showOpenDialog(Main.this);
			if (returnVal == JFileChooser.APPROVE_OPTION) {
				File file = fc.getSelectedFile();
				// This is where a real application would open the file.
				txtEdtapkfile.setText(file.getPath());
				inputAPKPath = file.getAbsolutePath();
			}
		} else if (e.getSource() == btnBrowseKeystore) {
			fc.setFileSelectionMode(JFileChooser.FILES_ONLY);
			FileNameExtensionFilter filter = new FileNameExtensionFilter("KEYSTORE FILES", "keystore");
			fc.setFileFilter(filter);
			int returnVal = fc.showOpenDialog(Main.this);
			if (returnVal == JFileChooser.APPROVE_OPTION) {
				File file = fc.getSelectedFile();
				// This is where a real application would open the file.
				txtChooseKeystore.setText(file.getPath());
				keystorePath = file.getAbsolutePath();
			}
		} else if (e.getSource() == btnChoose) {
			JFileChooser fileChoose = new JFileChooser();
			fileChoose.setDialogTitle("Select output destination for signed apk");
			fileChoose.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
			int returnVal = fileChoose.showOpenDialog(Main.this);
			if (returnVal == JFileChooser.APPROVE_OPTION) {
				File file = fileChoose.getSelectedFile();
				txtOutputFile.setText(file.getPath());
				outputApkPath = file.getPath();
				textPane.append(outputApkPath + "\n"); 
			}
		} else if (e.getSource() == btnRock) {
			new Thread(new Runnable() {
				@Override
				public void run() {
					// TODO Auto-generated method stub
					rock();
				}
			}).start();
		}
	}

	private void rock() {
		projectName = inputAPKPath.substring(0, inputAPKPath.length() - 4);
		afterBuildApkName = inputAPKPath.substring(inputAPKPath.lastIndexOf("/"), inputAPKPath.length());
		System.out.println(projectName);
		digApkFile(inputAPKPath);
		try {
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
			Document document = documentBuilder.parse(projectName + "/AndroidManifest.xml");
			rootElement = document.getDocumentElement();
			application = rootElement.getElementsByTagName("application").item(0);
			packageName = rootElement.getAttributes().getNamedItem("package").getNodeValue();
			// System.out.println(packageName);
			textPane.append(packageName + "\n");
			// mainClassName = getMainClassName(document);
			replaceMainActivity(document);
			addPermissions(document);
			writeToFile(document);
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		File srcFolder = new File("com");
		File destFolder = new File(projectName + "/smali/com");

		// make sure source exists
		if (!srcFolder.exists()) {
			// System.out.println("Directory does not exist.");
			textPane.append("Directory does not exist" + "\n");
		} else {
			try {
				copyFolder(srcFolder, destFolder);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		replaceMainActivitySmali();
		buildApk(projectName);
		signApk(projectName + "/dist" + afterBuildApkName);
	}
}
