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
module dazzle.PreferencesT;

public  import dazzle.c.functions;
public  import dazzle.c.types;
public  import glib.HashTable;
public  import glib.Str;
public  import gobject.ObjectG;
public  import gtk.Widget;


/** */
public template PreferencesT(TStruct)
{
	/** Get the main Gtk struct */
	public DzlPreferences* getPreferencesStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(DzlPreferences*)getStruct();
	}


	/** */
	public uint addCustom(string pageName, string groupName, Widget widget, string keywords, int priority)
	{
		return dzl_preferences_add_custom(getPreferencesStruct(), Str.toStringz(pageName), Str.toStringz(groupName), (widget is null) ? null : widget.getWidgetStruct(), Str.toStringz(keywords), priority);
	}

	/** */
	public uint addFileChooser(string pageName, string groupName, string schemaId, string key, string path, string title, string subtitle, GtkFileChooserAction action, string keywords, int priority)
	{
		return dzl_preferences_add_file_chooser(getPreferencesStruct(), Str.toStringz(pageName), Str.toStringz(groupName), Str.toStringz(schemaId), Str.toStringz(key), Str.toStringz(path), Str.toStringz(title), Str.toStringz(subtitle), action, Str.toStringz(keywords), priority);
	}

	/** */
	public uint addFontButton(string pageName, string groupName, string schemaId, string key, string title, string keywords, int priority)
	{
		return dzl_preferences_add_font_button(getPreferencesStruct(), Str.toStringz(pageName), Str.toStringz(groupName), Str.toStringz(schemaId), Str.toStringz(key), Str.toStringz(title), Str.toStringz(keywords), priority);
	}

	/** */
	public void addGroup(string pageName, string groupName, string title, int priority)
	{
		dzl_preferences_add_group(getPreferencesStruct(), Str.toStringz(pageName), Str.toStringz(groupName), Str.toStringz(title), priority);
	}

	/** */
	public void addListGroup(string pageName, string groupName, string title, GtkSelectionMode mode, int priority)
	{
		dzl_preferences_add_list_group(getPreferencesStruct(), Str.toStringz(pageName), Str.toStringz(groupName), Str.toStringz(title), mode, priority);
	}

	/** */
	public void addPage(string pageName, string title, int priority)
	{
		dzl_preferences_add_page(getPreferencesStruct(), Str.toStringz(pageName), Str.toStringz(title), priority);
	}

	/** */
	public uint addRadio(string pageName, string groupName, string schemaId, string key, string path, string variantString, string title, string subtitle, string keywords, int priority)
	{
		return dzl_preferences_add_radio(getPreferencesStruct(), Str.toStringz(pageName), Str.toStringz(groupName), Str.toStringz(schemaId), Str.toStringz(key), Str.toStringz(path), Str.toStringz(variantString), Str.toStringz(title), Str.toStringz(subtitle), Str.toStringz(keywords), priority);
	}

	/** */
	public uint addSpinButton(string pageName, string groupName, string schemaId, string key, string path, string title, string subtitle, string keywords, int priority)
	{
		return dzl_preferences_add_spin_button(getPreferencesStruct(), Str.toStringz(pageName), Str.toStringz(groupName), Str.toStringz(schemaId), Str.toStringz(key), Str.toStringz(path), Str.toStringz(title), Str.toStringz(subtitle), Str.toStringz(keywords), priority);
	}

	/** */
	public uint addSwitch(string pageName, string groupName, string schemaId, string key, string path, string variantString, string title, string subtitle, string keywords, int priority)
	{
		return dzl_preferences_add_switch(getPreferencesStruct(), Str.toStringz(pageName), Str.toStringz(groupName), Str.toStringz(schemaId), Str.toStringz(key), Str.toStringz(path), Str.toStringz(variantString), Str.toStringz(title), Str.toStringz(subtitle), Str.toStringz(keywords), priority);
	}

	/**
	 * Returns: A #GtkWidget or %NULL.
	 */
	public Widget getWidget(uint widgetId)
	{
		auto p = dzl_preferences_get_widget(getPreferencesStruct(), widgetId);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/** */
	public bool removeId(uint widgetId)
	{
		return dzl_preferences_remove_id(getPreferencesStruct(), widgetId) != 0;
	}

	/** */
	public void setPage(string pageName, HashTable map)
	{
		dzl_preferences_set_page(getPreferencesStruct(), Str.toStringz(pageName), (map is null) ? null : map.getHashTableStruct());
	}
}
