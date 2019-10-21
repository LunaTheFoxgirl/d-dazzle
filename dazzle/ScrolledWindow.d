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
module dazzle.ScrolledWindow;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ScrolledWindow : GtkScrolledWindowEx = ScrolledWindow;


/** */
public class ScrolledWindow : GtkScrolledWindowEx
{
	/** the main Gtk struct */
	protected DzlScrolledWindow* dzlScrolledWindow;

	/** Get the main Gtk struct */
	public DzlScrolledWindow* getDazzleScrolledWindowStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlScrolledWindow;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlScrolledWindow;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlScrolledWindow* dzlScrolledWindow, bool ownedRef = false)
	{
		this.dzlScrolledWindow = dzlScrolledWindow;
		super(cast(GtkScrolledWindow*)dzlScrolledWindow, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_scrolled_window_get_type();
	}
}
