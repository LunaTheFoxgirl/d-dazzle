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
module dazzle.Ring;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.MemorySlice;
private import gobject.ObjectG;
private import gtkd.Loader;


/** */
public final class Ring
{
	/** the main Gtk struct */
	protected DzlRing* dzlRing;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public DzlRing* getRingStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlRing;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)dzlRing;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlRing* dzlRing, bool ownedRef = false)
	{
		this.dzlRing = dzlRing;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_DAZZLE) && ownedRef )
			dzl_ring_unref(dzlRing);
	}


	/** */
	public @property ubyte* data()
	{
		return dzlRing.data;
	}

	/** Ditto */
	public @property void data(ubyte* value)
	{
		dzlRing.data = value;
	}

	/** */
	public @property uint len()
	{
		return dzlRing.len;
	}

	/** Ditto */
	public @property void len(uint value)
	{
		dzlRing.len = value;
	}

	/** */
	public @property uint pos()
	{
		return dzlRing.pos;
	}

	/** Ditto */
	public @property void pos(uint value)
	{
		dzlRing.pos = value;
	}

	/** */
	public static GType getType()
	{
		return dzl_ring_get_type();
	}

	/**
	 * Creates a new instance of #DzlRing with the given number of elements.
	 *
	 * Params:
	 *     elementSize = The size per element.
	 *     reservedSize = The number of elements to allocate.
	 *     elementDestroy = Notification called when removing an element.
	 *
	 * Returns: A new #DzlRing.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(uint elementSize, uint reservedSize, GDestroyNotify elementDestroy)
	{
		auto p = dzl_ring_sized_new(elementSize, reservedSize, elementDestroy);

		if(p is null)
		{
			throw new ConstructionException("null returned by sized_new");
		}

		this(cast(DzlRing*) p);
	}

	/**
	 * Appends @len values located at @data.
	 *
	 * Params:
	 *     data = A pointer to the array of values.
	 *     len = The number of values.
	 *
	 * Returns: the index of the first item.
	 */
	public uint appendVals(void* data, uint len)
	{
		return dzl_ring_append_vals(dzlRing, data, len);
	}

	alias foreac = foreach_;
	/**
	 * Calls @func for every item in the #DzlRing starting from the most recently
	 * inserted element to the least recently inserted.
	 *
	 * Params:
	 *     func = A #GFunc to call for each element.
	 *     userData = user data for @func.
	 */
	public void foreach_(GFunc func, void* userData)
	{
		dzl_ring_foreach(dzlRing, func, userData);
	}

	alias doref = ref_;
	/**
	 * Atomically increments the reference count of @ring by one.
	 *
	 * Returns: The @ring pointer.
	 */
	public Ring ref_()
	{
		auto p = dzl_ring_ref(dzlRing);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Ring)(cast(DzlRing*) p, true);
	}

	/**
	 * Atomically decrements the reference count of @ring by one.  When the
	 * reference count reaches zero, the structure is freed.
	 */
	public void unref()
	{
		dzl_ring_unref(dzlRing);
	}
}
