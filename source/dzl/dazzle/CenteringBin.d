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
module dazzle.CenteringBin;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Widget;


/**
 * First off, you probably want to use GtkBox with a center widget instead
 * of this widget. However, the case where this widget is useful is when
 * you cannot control your layout within the width of the toplevel, but
 * still want your child centered within the toplevel.
 * 
 * This is done by translating coordinates of the widget with respect to
 * the toplevel and anchoring the child at TRUE_CENTER-(alloc.width/2).
 */
public class CenteringBin : Bin
{
	/** the main Gtk struct */
	protected DzlCenteringBin* dzlCenteringBin;

	/** Get the main Gtk struct */
	public DzlCenteringBin* getCenteringBinStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlCenteringBin;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlCenteringBin;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlCenteringBin* dzlCenteringBin, bool ownedRef = false)
	{
		this.dzlCenteringBin = dzlCenteringBin;
		super(cast(GtkBin*)dzlCenteringBin, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_centering_bin_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_centering_bin_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlCenteringBin*) p);
	}
}
