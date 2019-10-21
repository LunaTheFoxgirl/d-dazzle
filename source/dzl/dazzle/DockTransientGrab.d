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
module dazzle.DockTransientGrab;

private import dazzle.DockItemIF;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Widget;


/** */
public class DockTransientGrab : ObjectG
{
	/** the main Gtk struct */
	protected DzlDockTransientGrab* dzlDockTransientGrab;

	/** Get the main Gtk struct */
	public DzlDockTransientGrab* getDockTransientGrabStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDockTransientGrab;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDockTransientGrab;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDockTransientGrab* dzlDockTransientGrab, bool ownedRef = false)
	{
		this.dzlDockTransientGrab = dzlDockTransientGrab;
		super(cast(GObject*)dzlDockTransientGrab, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_dock_transient_grab_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_dock_transient_grab_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlDockTransientGrab*) p, true);
	}

	/** */
	public void acquire()
	{
		dzl_dock_transient_grab_acquire(dzlDockTransientGrab);
	}

	/** */
	public void addItem(DockItemIF item)
	{
		dzl_dock_transient_grab_add_item(dzlDockTransientGrab, (item is null) ? null : item.getDockItemStruct());
	}

	/** */
	public void cancel()
	{
		dzl_dock_transient_grab_cancel(dzlDockTransientGrab);
	}

	/** */
	public bool contains(DockItemIF item)
	{
		return dzl_dock_transient_grab_contains(dzlDockTransientGrab, (item is null) ? null : item.getDockItemStruct()) != 0;
	}

	/** */
	public uint getTimeout()
	{
		return dzl_dock_transient_grab_get_timeout(dzlDockTransientGrab);
	}

	/** */
	public bool isDescendant(Widget widget)
	{
		return dzl_dock_transient_grab_is_descendant(dzlDockTransientGrab, (widget is null) ? null : widget.getWidgetStruct()) != 0;
	}

	/** */
	public void release()
	{
		dzl_dock_transient_grab_release(dzlDockTransientGrab);
	}

	/** */
	public void removeItem(DockItemIF item)
	{
		dzl_dock_transient_grab_remove_item(dzlDockTransientGrab, (item is null) ? null : item.getDockItemStruct());
	}

	/** */
	public void setTimeout(uint timeout)
	{
		dzl_dock_transient_grab_set_timeout(dzlDockTransientGrab, timeout);
	}

	/** */
	public void stealCommonAncestors(DockTransientGrab other)
	{
		dzl_dock_transient_grab_steal_common_ancestors(dzlDockTransientGrab, (other is null) ? null : other.getDockTransientGrabStruct());
	}
}
