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
module dazzle.ShortcutsSection;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gobject.Signals;
private import gtk.Box;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import std.algorithm;


/** */
public class ShortcutsSection : Box
{
	/** the main Gtk struct */
	protected DzlShortcutsSection* dzlShortcutsSection;

	/** Get the main Gtk struct */
	public DzlShortcutsSection* getShortcutsSectionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutsSection;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutsSection;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutsSection* dzlShortcutsSection, bool ownedRef = false)
	{
		this.dzlShortcutsSection = dzlShortcutsSection;
		super(cast(GtkBox*)dzlShortcutsSection, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcuts_section_get_type();
	}

	/** */
	gulong addOnChangeCurrentPage(bool delegate(int, ShortcutsSection) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "change-current-page", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
