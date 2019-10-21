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
module dazzle.FuzzyIndex;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.FileIF;
private import gio.ListModelIF;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import glib.Variant;
private import gobject.ObjectG;


/** */
public class FuzzyIndex : ObjectG
{
	/** the main Gtk struct */
	protected DzlFuzzyIndex* dzlFuzzyIndex;

	/** Get the main Gtk struct */
	public DzlFuzzyIndex* getFuzzyIndexStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlFuzzyIndex;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlFuzzyIndex;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlFuzzyIndex* dzlFuzzyIndex, bool ownedRef = false)
	{
		this.dzlFuzzyIndex = dzlFuzzyIndex;
		super(cast(GObject*)dzlFuzzyIndex, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_fuzzy_index_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_fuzzy_index_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlFuzzyIndex*) p, true);
	}

	/**
	 * Looks up the metadata for @key.
	 *
	 * Returns: A #GVariant or %NULL.
	 */
	public Variant getMetadata(string key)
	{
		auto p = dzl_fuzzy_index_get_metadata(dzlFuzzyIndex, Str.toStringz(key));

		if(p is null)
		{
			return null;
		}

		return new Variant(cast(GVariant*) p, true);
	}

	/** */
	public string getMetadataString(string key)
	{
		return Str.toString(dzl_fuzzy_index_get_metadata_string(dzlFuzzyIndex, Str.toStringz(key)));
	}

	/** */
	public uint getMetadataUint32(string key)
	{
		return dzl_fuzzy_index_get_metadata_uint32(dzlFuzzyIndex, Str.toStringz(key));
	}

	/** */
	public ulong getMetadataUint64(string key)
	{
		return dzl_fuzzy_index_get_metadata_uint64(dzlFuzzyIndex, Str.toStringz(key));
	}

	/** */
	public bool loadFile(FileIF file, Cancellable cancellable)
	{
		GError* err = null;

		auto p = dzl_fuzzy_index_load_file(dzlFuzzyIndex, (file is null) ? null : file.getFileStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public void loadFileAsync(FileIF file, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		dzl_fuzzy_index_load_file_async(dzlFuzzyIndex, (file is null) ? null : file.getFileStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/** */
	public bool loadFileFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto p = dzl_fuzzy_index_load_file_finish(dzlFuzzyIndex, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public void queryAsync(string query, uint maxMatches, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		dzl_fuzzy_index_query_async(dzlFuzzyIndex, Str.toStringz(query), maxMatches, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Completes an asynchronous request to dzl_fuzzy_index_query_async().
	 *
	 * Returns: A #GListModel of results.
	 *
	 * Throws: GException on failure.
	 */
	public ListModelIF queryFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto p = dzl_fuzzy_index_query_finish(dzlFuzzyIndex, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) p, true);
	}
}
