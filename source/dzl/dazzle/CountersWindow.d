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
module dazzle.CountersWindow;

private import dazzle.CounterArena;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Widget;
private import gtk.Window;


/** */
public class CountersWindow : Window
{
	/** the main Gtk struct */
	protected DzlCountersWindow* dzlCountersWindow;

	/** Get the main Gtk struct */
	public DzlCountersWindow* getCountersWindowStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlCountersWindow;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlCountersWindow;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlCountersWindow* dzlCountersWindow, bool ownedRef = false)
	{
		this.dzlCountersWindow = dzlCountersWindow;
		super(cast(GtkWindow*)dzlCountersWindow, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_counters_window_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_counters_window_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlCountersWindow*) p);
	}

	/**
	 * Gets the currently viewed arena, if any.
	 *
	 * Returns: A #DzlCounterArena or %NULL.
	 */
	public CounterArena getArena()
	{
		auto p = dzl_counters_window_get_arena(dzlCountersWindow);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(CounterArena)(cast(DzlCounterArena*) p);
	}

	/** */
	public void setArena(CounterArena arena)
	{
		dzl_counters_window_set_arena(dzlCountersWindow, (arena is null) ? null : arena.getCounterArenaStruct());
	}
}
