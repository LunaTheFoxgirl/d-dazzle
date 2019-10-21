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
module dazzle.PreferencesBin;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gobject.Signals;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import std.algorithm;


/** */
public class PreferencesBin : Bin
{
	/** the main Gtk struct */
	protected DzlPreferencesBin* dzlPreferencesBin;

	/** Get the main Gtk struct */
	public DzlPreferencesBin* getPreferencesBinStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPreferencesBin;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPreferencesBin;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPreferencesBin* dzlPreferencesBin, bool ownedRef = false)
	{
		this.dzlPreferencesBin = dzlPreferencesBin;
		super(cast(GtkBin*)dzlPreferencesBin, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_preferences_bin_get_type();
	}

	/** */
	gulong addOnPreferenceActivated(void delegate(PreferencesBin) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "preference-activated", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
