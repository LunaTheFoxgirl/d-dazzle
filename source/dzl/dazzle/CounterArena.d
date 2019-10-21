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
module dazzle.CounterArena;

private import dazzle.Counter;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtkd.Loader;


/** */
public class CounterArena
{
	/** the main Gtk struct */
	protected DzlCounterArena* dzlCounterArena;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public DzlCounterArena* getCounterArenaStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlCounterArena;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)dzlCounterArena;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlCounterArena* dzlCounterArena, bool ownedRef = false)
	{
		this.dzlCounterArena = dzlCounterArena;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_DAZZLE) && ownedRef )
			dzl_counter_arena_unref(dzlCounterArena);
	}


	/** */
	public static GType getType()
	{
		return dzl_counter_arena_get_type();
	}

	/** */
	public this(GPid pid)
	{
		auto p = dzl_counter_arena_new_for_pid(pid);

		if(p is null)
		{
			throw new ConstructionException("null returned by new_for_pid");
		}

		this(cast(DzlCounterArena*) p);
	}

	alias foreac = foreach_;
	/**
	 * Calls @func for every counter found in @area.
	 *
	 * Params:
	 *     func = A callback to execute
	 *     userData = user data for @func
	 */
	public void foreach_(DzlCounterForeachFunc func, void* userData)
	{
		dzl_counter_arena_foreach(dzlCounterArena, func, userData);
	}

	alias doref = ref_;
	/** */
	public CounterArena ref_()
	{
		auto p = dzl_counter_arena_ref(dzlCounterArena);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(CounterArena)(cast(DzlCounterArena*) p, true);
	}

	/** */
	public void register(Counter counter)
	{
		dzl_counter_arena_register(dzlCounterArena, (counter is null) ? null : counter.getCounterStruct());
	}

	/** */
	public void unref()
	{
		dzl_counter_arena_unref(dzlCounterArena);
	}

	/** */
	public static CounterArena getDefault()
	{
		auto p = dzl_counter_arena_get_default();

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(CounterArena)(cast(DzlCounterArena*) p, true);
	}
}
