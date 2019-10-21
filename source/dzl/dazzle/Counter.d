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
module dazzle.Counter;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.MemorySlice;
private import glib.Str;
private import gtkd.Loader;


/** */
public final class Counter
{
	/** the main Gtk struct */
	protected DzlCounter* dzlCounter;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public DzlCounter* getCounterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlCounter;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)dzlCounter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlCounter* dzlCounter, bool ownedRef = false)
	{
		this.dzlCounter = dzlCounter;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_DAZZLE) && ownedRef )
			sliceFree(dzlCounter);
	}


	/** */
	public @property DzlCounterValue* values()
	{
		return dzlCounter.values;
	}

	/** Ditto */
	public @property void values(DzlCounterValue* value)
	{
		dzlCounter.values = value;
	}

	/** */
	public @property string category()
	{
		return Str.toString(dzlCounter.category);
	}

	/** Ditto */
	public @property void category(string value)
	{
		dzlCounter.category = Str.toStringz(value);
	}

	/** */
	public @property string name()
	{
		return Str.toString(dzlCounter.name);
	}

	/** Ditto */
	public @property void name(string value)
	{
		dzlCounter.name = Str.toStringz(value);
	}

	/** */
	public @property string description()
	{
		return Str.toString(dzlCounter.description);
	}

	/** Ditto */
	public @property void description(string value)
	{
		dzlCounter.description = Str.toStringz(value);
	}

	/** */
	public long get()
	{
		return dzl_counter_get(dzlCounter);
	}

	/** */
	public void reset()
	{
		dzl_counter_reset(dzlCounter);
	}
}
