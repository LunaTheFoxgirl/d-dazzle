/*
 * This file is part of d-dazzle.
 *
 * d-dazzle is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * d-dazzle is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with d-dazzle; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */
module dazzle.PreferencesIF;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.HashTable;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Widget;


/** */
public interface PreferencesIF{
	/** Get the main Gtk struct */
	public DzlPreferences* getPreferencesStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return dzl_preferences_get_type();
	}

	/** */
	public uint addCustom(string pageName, string groupName, Widget widget, string keywords, int priority);

	/** */
	public uint addFileChooser(string pageName, string groupName, string schemaId, string key, string path, string title, string subtitle, GtkFileChooserAction action, string keywords, int priority);

	/** */
	public uint addFontButton(string pageName, string groupName, string schemaId, string key, string title, string keywords, int priority);

	/** */
	public void addGroup(string pageName, string groupName, string title, int priority);

	/** */
	public void addListGroup(string pageName, string groupName, string title, GtkSelectionMode mode, int priority);

	/** */
	public void addPage(string pageName, string title, int priority);

	/** */
	public uint addRadio(string pageName, string groupName, string schemaId, string key, string path, string variantString, string title, string subtitle, string keywords, int priority);

	/** */
	public uint addSpinButton(string pageName, string groupName, string schemaId, string key, string path, string title, string subtitle, string keywords, int priority);

	/** */
	public uint addSwitch(string pageName, string groupName, string schemaId, string key, string path, string variantString, string title, string subtitle, string keywords, int priority);

	/**
	 * Returns: A #GtkWidget or %NULL.
	 */
	public Widget getWidget(uint widgetId);

	/** */
	public bool removeId(uint widgetId);

	/** */
	public void setPage(string pageName, HashTable map);
}
