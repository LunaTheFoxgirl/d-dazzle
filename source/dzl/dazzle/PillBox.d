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
module dazzle.PillBox;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.EventBox;
private import gtk.Widget;


/** */
public class PillBox : EventBox
{
	/** the main Gtk struct */
	protected DzlPillBox* dzlPillBox;

	/** Get the main Gtk struct */
	public DzlPillBox* getPillBoxStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPillBox;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPillBox;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPillBox* dzlPillBox, bool ownedRef = false)
	{
		this.dzlPillBox = dzlPillBox;
		super(cast(GtkEventBox*)dzlPillBox, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_pill_box_get_type();
	}

	/** */
	public this(string label)
	{
		auto p = dzl_pill_box_new(Str.toStringz(label));

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlPillBox*) p);
	}

	/** */
	public string getLabel()
	{
		return Str.toString(dzl_pill_box_get_label(dzlPillBox));
	}

	/** */
	public void setLabel(string label)
	{
		dzl_pill_box_set_label(dzlPillBox, Str.toStringz(label));
	}
}
