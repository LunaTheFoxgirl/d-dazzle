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
module dazzle.EntryBox;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Box;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.Widget;


/** */
public class EntryBox : Box
{
	/** the main Gtk struct */
	protected DzlEntryBox* dzlEntryBox;

	/** Get the main Gtk struct */
	public DzlEntryBox* getEntryBoxStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlEntryBox;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlEntryBox;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlEntryBox* dzlEntryBox, bool ownedRef = false)
	{
		this.dzlEntryBox = dzlEntryBox;
		super(cast(GtkBox*)dzlEntryBox, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_entry_box_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_entry_box_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlEntryBox*) p);
	}
}
