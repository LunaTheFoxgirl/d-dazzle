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
module dazzle.Trie;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtkd.Loader;


/** */
public class Trie
{
	/** the main Gtk struct */
	protected DzlTrie* dzlTrie;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public DzlTrie* getTrieStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlTrie;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)dzlTrie;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlTrie* dzlTrie, bool ownedRef = false)
	{
		this.dzlTrie = dzlTrie;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_DAZZLE) && ownedRef )
			dzl_trie_unref(dzlTrie);
	}


	/** */
	public static GType getType()
	{
		return dzl_trie_get_type();
	}

	/**
	 * Creates a new #DzlTrie. When a value is removed from the trie, @value_destroy
	 * will be called to allow you to release any resources.
	 *
	 * Params:
	 *     valueDestroy = A #GDestroyNotify, or %NULL.
	 *
	 * Returns: A newly allocated #DzlTrie that should be freed
	 *     with dzl_trie_unref().
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GDestroyNotify valueDestroy)
	{
		auto p = dzl_trie_new(valueDestroy);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlTrie*) p);
	}

	/**
	 * This is an alias for dzl_trie_unref().
	 */
	public void destroy()
	{
		dzl_trie_destroy(dzlTrie);
	}

	/**
	 * Inserts @value into @trie located with @key.
	 *
	 * Params:
	 *     key = The key to insert.
	 *     value = The value to insert.
	 */
	public void insert(string key, void* value)
	{
		dzl_trie_insert(dzlTrie, Str.toStringz(key), value);
	}

	/**
	 * Looks up @key in @trie and returns the value associated.
	 *
	 * Params:
	 *     key = The key to lookup.
	 *
	 * Returns: The value inserted or %NULL.
	 */
	public void* lookup(string key)
	{
		return dzl_trie_lookup(dzlTrie, Str.toStringz(key));
	}

	alias doref = ref_;
	/** */
	public Trie ref_()
	{
		auto p = dzl_trie_ref(dzlTrie);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Trie)(cast(DzlTrie*) p, true);
	}

	/**
	 * Removes @key from @trie, possibly destroying the value associated with
	 * the key.
	 *
	 * Params:
	 *     key = The key to remove.
	 *
	 * Returns: %TRUE if @key was found, otherwise %FALSE.
	 */
	public bool remove(string key)
	{
		return dzl_trie_remove(dzlTrie, Str.toStringz(key)) != 0;
	}

	/**
	 * Traverses all nodes of @trie according to the parameters. For each node
	 * matching the traversal parameters, @func will be executed.
	 *
	 * Only %G_PRE_ORDER and %G_POST_ORDER are supported for @order.
	 *
	 * If @max_depth is less than zero, the entire tree will be traversed.
	 * If max_depth is 1, then only the root will be traversed.
	 *
	 * Params:
	 *     key = The key to start traversal from.
	 *     order = The order to traverse.
	 *     flags = The flags for which nodes to callback.
	 *     maxDepth = the maximum depth to process.
	 *     func = The func to execute for each matching node.
	 *     userData = User data for @func.
	 */
	public void traverse(string key, GTraverseType order, GTraverseFlags flags, int maxDepth, DzlTrieTraverseFunc func, void* userData)
	{
		dzl_trie_traverse(dzlTrie, Str.toStringz(key), order, flags, maxDepth, func, userData);
	}

	/**
	 * Drops the reference count by one on @trie. When it reaches zero, the
	 * structure is freed.
	 */
	public void unref()
	{
		dzl_trie_unref(dzlTrie);
	}
}
