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
module dazzle.PathBar;

private import dazzle.Path;
private import dazzle.PathElement;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.Menu;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Box;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.Widget;
private import std.algorithm;


/** */
public class PathBar : Box
{
	/** the main Gtk struct */
	protected DzlPathBar* dzlPathBar;

	/** Get the main Gtk struct */
	public DzlPathBar* getPathBarStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPathBar;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPathBar;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPathBar* dzlPathBar, bool ownedRef = false)
	{
		this.dzlPathBar = dzlPathBar;
		super(cast(GtkBox*)dzlPathBar, ownedRef);
	}

	alias getPath = Widget.getPath;

	/**
	 * Gets the path for the view.
	 *
	 * Returns: A #DzlPath.
	 */
	public Path getPath()
	{
		auto p = dzl_path_bar_get_path(dzlPathBar);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Path)(cast(DzlPath*) p);
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_path_bar_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_path_bar_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlPathBar*) p);
	}

	/** */
	public void setPath(Path path)
	{
		dzl_path_bar_set_path(dzlPathBar, (path is null) ? null : path.getPathStruct());
	}

	/** */
	public void setSelectedIndex(uint index)
	{
		dzl_path_bar_set_selected_index(dzlPathBar, index);
	}

	/** */
	gulong addOnElementSelected(void delegate(Path, PathElement, PathBar) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "element-selected", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnPopulateMenu(void delegate(Path, PathElement, Menu, PathBar) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "populate-menu", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
