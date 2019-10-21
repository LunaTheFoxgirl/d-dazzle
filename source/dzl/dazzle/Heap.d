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
module dazzle.Heap;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.Str;
private import gobject.ObjectG;
private import gtkd.Loader;


/**
 * Heaps are similar to a partially sorted tree but implemented as an
 * array. They allow for efficient O(1) lookup of the highest priority
 * item as it will always be the first item of the array.
 * 
 * To create a new heap use dzl_heap_new().
 * 
 * To add items to the heap, use dzl_heap_insert_val() or
 * dzl_heap_insert_vals() to insert in bulk.
 * 
 * To access an item in the heap, use dzl_heap_index().
 * 
 * To remove an arbitrary item from the heap, use dzl_heap_extract_index().
 * 
 * To remove the highest priority item in the heap, use dzl_heap_extract().
 * 
 * To free a heap, use dzl_heap_unref().
 * 
 * Here is an example that stores integers in a #DzlHeap:
 * |[<!-- language="C" -->
 * static int
 * cmpint (gconstpointer a,
 * gconstpointer b)
 * {
 * return *(const gint *)a - *(const gint *)b;
 * }
 * 
 * int
 * main (gint   argc,
 * gchar *argv[])
 * {
 * DzlHeap *heap;
 * gint i;
 * gint v;
 * 
 * heap = dzl_heap_new (sizeof (gint), cmpint);
 * 
 * for (i = 0; i < 10000; i++)
 * dzl_heap_insert_val (heap, i);
 * for (i = 0; i < 10000; i++)
 * dzl_heap_extract (heap, &v);
 * 
 * dzl_heap_unref (heap);
 * }
 * ]|
 */
public final class Heap
{
	/** the main Gtk struct */
	protected DzlHeap* dzlHeap;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public DzlHeap* getHeapStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlHeap;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)dzlHeap;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlHeap* dzlHeap, bool ownedRef = false)
	{
		this.dzlHeap = dzlHeap;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_DAZZLE) && ownedRef )
			dzl_heap_unref(dzlHeap);
	}


	/** */
	public @property string data()
	{
		return Str.toString(dzlHeap.data);
	}

	/** Ditto */
	public @property void data(string value)
	{
		dzlHeap.data = Str.toStringz(value);
	}

	/** */
	public @property size_t len()
	{
		return dzlHeap.len;
	}

	/** Ditto */
	public @property void len(size_t value)
	{
		dzlHeap.len = value;
	}

	/** */
	public static GType getType()
	{
		return dzl_heap_get_type();
	}

	/**
	 * Creates a new #DzlHeap. A heap is a tree-like structure stored in
	 * an array that is not fully sorted, but head is guaranteed to be either
	 * the max, or min value based on @compare_func. This is also known as
	 * a priority queue.
	 *
	 * Params:
	 *     elementSize = the size of each element in the heap
	 *     compareFunc = a function to compare to elements
	 *
	 * Returns: A newly allocated #DzlHeap
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(uint elementSize, GCompareFunc compareFunc)
	{
		auto p = dzl_heap_new(elementSize, compareFunc);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlHeap*) p);
	}

	/** */
	public bool extract(void* result)
	{
		return dzl_heap_extract(dzlHeap, result) != 0;
	}

	/** */
	public bool extractIndex(size_t index, void* result)
	{
		return dzl_heap_extract_index(dzlHeap, index, result) != 0;
	}

	/** */
	public void insertVals(void* data, uint len)
	{
		dzl_heap_insert_vals(dzlHeap, data, len);
	}

	alias doref = ref_;
	/**
	 * Increments the reference count of @heap by one.
	 *
	 * Returns: @heap
	 */
	public Heap ref_()
	{
		auto p = dzl_heap_ref(dzlHeap);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Heap)(cast(DzlHeap*) p, true);
	}

	/**
	 * Decrements the reference count of @heap by one, freeing the structure
	 * when the reference count reaches zero.
	 */
	public void unref()
	{
		dzl_heap_unref(dzlHeap);
	}
}
