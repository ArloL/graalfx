package io.github.arlol.graalfx;

public class Launcher {

	public static void main(String[] args) {
		if (args.length == 1 && "--version".equals(args[0])) {
			Package pkg = Launcher.class.getPackage();
			String title = pkg.getImplementationTitle();
			String version = pkg.getImplementationVersion();
			System.out.println(title + " version \"" + version + "\"");
			return;
		}
		GraalFX.main(args);
	}

}
