all: chiptop_dm.gds chiptop_dodpo.gds

chiptop_dm.gds: chiptop.gds Dummy_Metal_Calibre_65nm.25a
	calibre -drc Dummy_Metal_Calibre_65nm.25a

chiptop_dodpo.gds: chiptop.gds Dummy_OD_PO_Calibre_65nm.25a
	calibre -drc Dummy_OD_PO_Calibre_65nm.25a

.PHONY: clean
clean:
	rm -rf *.sum
	rm -rf *.txt
	rm -rf *.gds*
