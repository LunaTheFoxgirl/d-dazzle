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
module dazzle.RadioBox;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Widget;
private import std.algorithm;


/** */
public class RadioBox : Bin
{
	/** the main Gtk struct */
	protected DzlRadioBox* dzlRadioBox;

	/** Get the main Gtk struct */
	public DzlRadioBox* getRadioBoxStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlRadioBox;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlRadioBox;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlRadioBox* dzlRadioBox, bool ownedRef = false)
	{
		this.dzlRadioBox = dzlRadioBox;
		super(cast(GtkBin*)dzlRadioBox, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_radio_box_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_radio_box_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlRadioBox*) p);
	}

	/** */
	public void addItem(string id, string text)
	{
		dzl_radio_box_add_item(dzlRadioBox, Str.toStringz(id), Str.toStringz(text));
	}

	/** */
	public string getActiveId()
	{
		return Str.toString(dzl_radio_box_get_active_id(dzlRadioBox));
	}

	/** */
	public void removeItem(string id)
	{
		dzl_radio_box_remove_item(dzlRadioBox, Str.toStringz(id));
	}

	/** */
	public void setActiveId(string id)
	{
		dzl_radio_box_set_active_id(dzlRadioBox, Str.toStringz(id));
	}

	/** */
	gulong addOnChanged(void delegate(RadioBox) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
