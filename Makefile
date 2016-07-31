.PHONY: install uninstall


DIR_BIN = /usr/bin
DIR_GIMP_SCRIPTS = /usr/share/gimp/2.0/scripts



install:
	cp ./gimp-effect-GFTornPager $(DIR_BIN)
	chmod +x $(DIR_BIN)/gimp-effect-GFTornPager
	
	mkdir -p $(DIR_GIMP_SCRIPTS)
	cp ./GFTornPaper.scm $(DIR_GIMP_SCRIPTS)
	cp ./GFTornPaperBatch.scm $(DIR_GIMP_SCRIPTS)



uninstall:
	rm $(DIR_BIN)/gimp-effect-GFTornPager
	
	rm $(DIR_GIMP_SCRIPTS)/GFTornPaper.scm
	rm $(DIR_GIMP_SCRIPTS)/GFTornPaperBatch.scm
