#!/usr/bin/python3
import subprocess
import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk as gtk
from pathlib import Path
home = str(Path.home())

class SeemZ:
	def __init__(self):
		fileTheme=open(home+"/.SeemZ/theme.list","r")
		interface = gtk.Builder()
		interface.add_from_file('/etc/seemz/seemz.glade')
		# print(str(interface.get_objects()))
		# self.listMenu=interface.get_object("")
		self.Menu=interface.get_object("menu_seemz")
		self.statusicon=interface.get_object("statusIcon_seemz")
		self.Menu_quit=interface.get_object("menu_item_quit")
		for theme in fileTheme:
			item=gtk.MenuItem.new_with_label(theme)
			item.connect("activate",self.theme_choosen)
			# item.set_label=theme
			self.Menu.append(item)
		fileTheme.close()
		fileThemeActive=open(home+"/.SeemZ/theme.active","r")
		for active in fileThemeActive:
			item=gtk.MenuItem.new_with_label("-> "+active)
			self.itemActivate=item
			# child = gtk.bin.get_child(menu_item);
			# gtk.Label_set_markup (GTK_LABEL (child), "<b>"+active+"</b>")
			# child = gtk_bin_get_child (GTK_BIN (item));
			# item.active.set_markup()
			# item.set_label=
			self.Menu.append(item)
		fileThemeActive.close()
		self.Menu.append(self.Menu_quit)
		
		# get the theme value to init select item :=====))))))

		# IDENTIFIANT menu_item_theme = menu_item_theme0



		# self.popoverMenu.set_relative_to()

		# self.app=interface.get_object("main_seemz_app")
		# avant connexion signal -> interface crée MenulistItem dynamiquement 
		interface.connect_signals(self)
		# self.buttonDesk.connect("clicked", self.)
		# self.app.show_all()

	def on_mainWindow_destroy(self):
		# print("destroy app")
		gtk.main_quit()
	# def onclick(self,widget):
	# 	# lorsqu'on click sur l'icon
	def theme_choosen(self,widget):
		# signal activate
		themeChoose=widget.get_label()
		oldFile=open(home+"/.SeemZ/theme.active","r")
		oldTheme=oldFile.read()
		oldFile.close()
		mvtheme=open(home+"/.SeemZ/theme.list", "r")
		writeList=""
		for old in mvtheme:
			if themeChoose!=old :
				writeList+=old
		writeList+=oldTheme
		print(writeList)
		mvtheme.close()
		mvtheme=open(home+"/.SeemZ/theme.list", "w+")
		mvtheme.write(writeList)
		mvtheme.close()
		oldFile=open(home+"/.SeemZ/theme.active","w+")
		oldFile.write(themeChoose)
		oldFile.close()

		#code clean :)))))#########
		
		file=open(home+"/.SeemZ/theme.active","w+")
		file.write(themeChoose)
		file.close()
		self.itemActivate.set_label("-> "+themeChoose)
		toRM=self.Menu.get_active()
		self.Menu.remove(toRM)
		item=gtk.MenuItem.new_with_label(oldTheme)
		item.connect("activate",self.theme_choosen)
		self.Menu.append(item)
		self.Menu.reorder_child(item,0)
		# on peut appeler le script
		# !!!!! attention au chmod de seemz-cli !!!!! ==> chmod u+rx seemz-cli
		try:
			subprocess.run("seemz-cli", check=True)
		except:
			#voir pour crée un folder de log ici
			self.on_mainWindow_destroy()
	def icon_click(self, icon, button, time):
		#bind on popup-menu
		self.Menu.show_all()
		self.Menu.popup(None, None, None, self, button, time)

	def row_quit(self,widget):
		#activation de la ligne quit
		# print("row_quit")
		self.on_mainWindow_destroy()


if __name__ == "__main__":
	SeemZ()
	gtk.main()

# note : dans le main il faut lire le fichier contenant liste de theme => on edit l'interface .glade