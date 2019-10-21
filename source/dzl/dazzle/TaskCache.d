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
module dazzle.TaskCache;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.AsyncResultIF;
private import gio.Cancellable;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.PtrArray;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class TaskCache : ObjectG
{
	/** the main Gtk struct */
	protected DzlTaskCache* dzlTaskCache;

	/** Get the main Gtk struct */
	public DzlTaskCache* getTaskCacheStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlTaskCache;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlTaskCache;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlTaskCache* dzlTaskCache, bool ownedRef = false)
	{
		this.dzlTaskCache = dzlTaskCache;
		super(cast(GObject*)dzlTaskCache, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_task_cache_get_type();
	}

	/** */
	public this(GHashFunc keyHashFunc, GEqualFunc keyEqualFunc, GBoxedCopyFunc keyCopyFunc, GBoxedFreeFunc keyDestroyFunc, GBoxedCopyFunc valueCopyFunc, GBoxedFreeFunc valueFreeFunc, long timeToLiveMsec, DzlTaskCacheCallback populateCallback, void* populateCallbackData, GDestroyNotify populateCallbackDataDestroy)
	{
		auto p = dzl_task_cache_new(keyHashFunc, keyEqualFunc, keyCopyFunc, keyDestroyFunc, valueCopyFunc, valueFreeFunc, timeToLiveMsec, populateCallback, populateCallbackData, populateCallbackDataDestroy);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlTaskCache*) p, true);
	}

	/** */
	public bool evict(void* key)
	{
		return dzl_task_cache_evict(dzlTaskCache, key) != 0;
	}

	/** */
	public void evictAll()
	{
		dzl_task_cache_evict_all(dzlTaskCache);
	}

	/** */
	public void getAsync(void* key, bool forceUpdate, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		dzl_task_cache_get_async(dzlTaskCache, key, forceUpdate, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finish a call to dzl_task_cache_get_async().
	 *
	 * Returns: The result from the cache.
	 *
	 * Throws: GException on failure.
	 */
	public void* getFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto p = dzl_task_cache_get_finish(dzlTaskCache, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Gets all the values in the cache.
	 *
	 * The caller owns the resulting GPtrArray, which itself owns a reference to the children.
	 *
	 * Returns: The values.
	 */
	public PtrArray getValues()
	{
		auto p = dzl_task_cache_get_values(dzlTaskCache);

		if(p is null)
		{
			return null;
		}

		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Peeks to see @key is contained in the cache and returns the
	 * matching #GObject if it does.
	 *
	 * The reference count of the resulting #GObject is not incremented.
	 * For that reason, it is important to remember that this function
	 * may only be called from the main thread.
	 *
	 * Params:
	 *     key = The key for the cache
	 *
	 * Returns: A #GObject or
	 *     %NULL if the key was not found in the cache.
	 */
	public ObjectG peek(void* key)
	{
		auto p = dzl_task_cache_peek(dzlTaskCache, key);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ObjectG)(cast(GObject*) p);
	}

	/** */
	public void setName(string name)
	{
		dzl_task_cache_set_name(dzlTaskCache, Str.toStringz(name));
	}
}
