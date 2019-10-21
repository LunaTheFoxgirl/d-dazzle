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
module dazzle.FuzzyMutableIndex;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ArrayG;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtkd.Loader;


/** */
public class FuzzyMutableIndex
{
	/** the main Gtk struct */
	protected DzlFuzzyMutableIndex* dzlFuzzyMutableIndex;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public DzlFuzzyMutableIndex* getFuzzyMutableIndexStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlFuzzyMutableIndex;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)dzlFuzzyMutableIndex;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlFuzzyMutableIndex* dzlFuzzyMutableIndex, bool ownedRef = false)
	{
		this.dzlFuzzyMutableIndex = dzlFuzzyMutableIndex;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_DAZZLE) && ownedRef )
			dzl_fuzzy_mutable_index_unref(dzlFuzzyMutableIndex);
	}


	/** */
	public static GType getType()
	{
		return dzl_fuzzy_mutable_index_get_type();
	}

	/**
	 * Create a new #Fuzzy for fuzzy matching strings.
	 *
	 * Params:
	 *     caseSensitive = %TRUE if case should be preserved.
	 *
	 * Returns: A newly allocated #Fuzzy that should be freed with dzl_fuzzy_mutable_index_unref().
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(bool caseSensitive)
	{
		auto p = dzl_fuzzy_mutable_index_new(caseSensitive);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlFuzzyMutableIndex*) p);
	}

	/** */
	public this(bool caseSensitive, GDestroyNotify freeFunc)
	{
		auto p = dzl_fuzzy_mutable_index_new_with_free_func(caseSensitive, freeFunc);

		if(p is null)
		{
			throw new ConstructionException("null returned by new_with_free_func");
		}

		this(cast(DzlFuzzyMutableIndex*) p);
	}

	/**
	 * Start a bulk insertion. @fuzzy is not ready for searching until
	 * dzl_fuzzy_mutable_index_end_bulk_insert() has been called.
	 *
	 * This allows for inserting large numbers of strings and deferring
	 * the final sort until dzl_fuzzy_mutable_index_end_bulk_insert().
	 */
	public void beginBulkInsert()
	{
		dzl_fuzzy_mutable_index_begin_bulk_insert(dzlFuzzyMutableIndex);
	}

	/** */
	public bool contains(string key)
	{
		return dzl_fuzzy_mutable_index_contains(dzlFuzzyMutableIndex, Str.toStringz(key)) != 0;
	}

	/**
	 * Complete a bulk insert and resort the index.
	 */
	public void endBulkInsert()
	{
		dzl_fuzzy_mutable_index_end_bulk_insert(dzlFuzzyMutableIndex);
	}

	/**
	 * Inserts a string into the fuzzy matcher.
	 *
	 * Params:
	 *     key = A UTF-8 encoded string.
	 *     value = A value to associate with key.
	 */
	public void insert(string key, void* value)
	{
		dzl_fuzzy_mutable_index_insert(dzlFuzzyMutableIndex, Str.toStringz(key), value);
	}

	/**
	 * DzlFuzzyMutableIndex searches within @fuzzy for strings that fuzzy match @needle.
	 * Only up to @max_matches will be returned.
	 *
	 * TODO: max_matches is not yet respected.
	 *
	 * Params:
	 *     needle = The needle to fuzzy search for.
	 *     maxMatches = The max number of matches to return.
	 *
	 * Returns: A newly allocated
	 *     #GArray containing #FuzzyMatch elements. This should be freed when
	 *     the caller is done with it using g_array_unref().
	 *     It is a programming error to keep the structure around longer than
	 *     the @fuzzy instance.
	 */
	public ArrayG match(string needle, size_t maxMatches)
	{
		auto p = dzl_fuzzy_mutable_index_match(dzlFuzzyMutableIndex, Str.toStringz(needle), maxMatches);

		if(p is null)
		{
			return null;
		}

		return new ArrayG(cast(GArray*) p, true);
	}

	alias doref = ref_;
	/** */
	public FuzzyMutableIndex ref_()
	{
		auto p = dzl_fuzzy_mutable_index_ref(dzlFuzzyMutableIndex);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FuzzyMutableIndex)(cast(DzlFuzzyMutableIndex*) p, true);
	}

	/** */
	public void remove(string key)
	{
		dzl_fuzzy_mutable_index_remove(dzlFuzzyMutableIndex, Str.toStringz(key));
	}

	/** */
	public void setFreeFunc(GDestroyNotify freeFunc)
	{
		dzl_fuzzy_mutable_index_set_free_func(dzlFuzzyMutableIndex, freeFunc);
	}

	/**
	 * Decrements the reference count of fuzzy by one. When the reference count
	 * reaches zero, the structure will be freed.
	 */
	public void unref()
	{
		dzl_fuzzy_mutable_index_unref(dzlFuzzyMutableIndex);
	}
}
