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
module dazzle.FileChooserEntry;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.FileIF;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Entry;
private import gtk.Widget;


/** */
public class FileChooserEntry : Bin
{
	/** the main Gtk struct */
	protected DzlFileChooserEntry* dzlFileChooserEntry;

	/** Get the main Gtk struct */
	public DzlFileChooserEntry* getFileChooserEntryStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlFileChooserEntry;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlFileChooserEntry;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlFileChooserEntry* dzlFileChooserEntry, bool ownedRef = false)
	{
		this.dzlFileChooserEntry = dzlFileChooserEntry;
		super(cast(GtkBin*)dzlFileChooserEntry, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_file_chooser_entry_get_type();
	}

	/** */
	public this(string title, GtkFileChooserAction action)
	{
		auto p = dzl_file_chooser_entry_new(Str.toStringz(title), action);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlFileChooserEntry*) p);
	}

	/**
	 * Gets the entry used by the #GtkEntry.
	 *
	 * Returns: a #GtkEntry
	 *
	 * Since: 3.32
	 */
	public Entry getEntry()
	{
		auto p = dzl_file_chooser_entry_get_entry(dzlFileChooserEntry);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Entry)(cast(GtkEntry*) p);
	}

	/**
	 * Returns the currently selected file or %NULL if there is no selection.
	 *
	 * Returns: A #GFile or %NULL.
	 */
	public FileIF getFile()
	{
		auto p = dzl_file_chooser_entry_get_file(dzlFileChooserEntry);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileIF)(cast(GFile*) p, true);
	}

	/** */
	public void setFile(FileIF file)
	{
		dzl_file_chooser_entry_set_file(dzlFileChooserEntry, (file is null) ? null : file.getFileStruct());
	}
}
