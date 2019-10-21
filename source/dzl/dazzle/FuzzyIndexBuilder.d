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
module dazzle.FuzzyIndexBuilder;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.FileIF;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import glib.Variant;
private import gobject.ObjectG;


/** */
public class FuzzyIndexBuilder : ObjectG
{
	/** the main Gtk struct */
	protected DzlFuzzyIndexBuilder* dzlFuzzyIndexBuilder;

	/** Get the main Gtk struct */
	public DzlFuzzyIndexBuilder* getFuzzyIndexBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlFuzzyIndexBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlFuzzyIndexBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlFuzzyIndexBuilder* dzlFuzzyIndexBuilder, bool ownedRef = false)
	{
		this.dzlFuzzyIndexBuilder = dzlFuzzyIndexBuilder;
		super(cast(GObject*)dzlFuzzyIndexBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_fuzzy_index_builder_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_fuzzy_index_builder_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlFuzzyIndexBuilder*) p, true);
	}

	/** */
	public bool getCaseSensitive()
	{
		return dzl_fuzzy_index_builder_get_case_sensitive(dzlFuzzyIndexBuilder) != 0;
	}

	/**
	 * Returns the document that was inserted in a previous call to
	 * dzl_fuzzy_index_builder_insert().
	 *
	 * Returns: A #GVariant
	 */
	public Variant getDocument(ulong documentId)
	{
		auto p = dzl_fuzzy_index_builder_get_document(dzlFuzzyIndexBuilder, documentId);

		if(p is null)
		{
			return null;
		}

		return new Variant(cast(GVariant*) p);
	}

	/**
	 * Inserts @document into the index using @key as the lookup key.
	 *
	 * If a matching document (checked by hashing @document) has already
	 * been inserted, only a single instance of the document will be stored.
	 *
	 * If @document is floating, it will be consumed.
	 *
	 * @priority may be used to group results by priority. Priority must be
	 * less than 256.
	 *
	 * Params:
	 *     key = The UTF-8 encoded key for the document
	 *     document = The document to store
	 *     priority = An optional priority for the keyword.
	 *
	 * Returns: The document id registered for @document.
	 */
	public ulong insert(string key, Variant document, uint priority)
	{
		return dzl_fuzzy_index_builder_insert(dzlFuzzyIndexBuilder, Str.toStringz(key), (document is null) ? null : document.getVariantStruct(), priority);
	}

	/** */
	public void setCaseSensitive(bool caseSensitive)
	{
		dzl_fuzzy_index_builder_set_case_sensitive(dzlFuzzyIndexBuilder, caseSensitive);
	}

	/** */
	public void setMetadata(string key, Variant value)
	{
		dzl_fuzzy_index_builder_set_metadata(dzlFuzzyIndexBuilder, Str.toStringz(key), (value is null) ? null : value.getVariantStruct());
	}

	/** */
	public void setMetadataString(string key, string value)
	{
		dzl_fuzzy_index_builder_set_metadata_string(dzlFuzzyIndexBuilder, Str.toStringz(key), Str.toStringz(value));
	}

	/** */
	public void setMetadataUint32(string key, uint value)
	{
		dzl_fuzzy_index_builder_set_metadata_uint32(dzlFuzzyIndexBuilder, Str.toStringz(key), value);
	}

	/** */
	public void setMetadataUint64(string key, ulong value)
	{
		dzl_fuzzy_index_builder_set_metadata_uint64(dzlFuzzyIndexBuilder, Str.toStringz(key), value);
	}

	/** */
	public bool write(FileIF file, int ioPriority, Cancellable cancellable)
	{
		GError* err = null;

		auto p = dzl_fuzzy_index_builder_write(dzlFuzzyIndexBuilder, (file is null) ? null : file.getFileStruct(), ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Builds and writes the index to @file. The file format is a
	 * GVariant on disk and can be loaded and searched using
	 * #FuzzyIndex.
	 *
	 * Params:
	 *     file = A #GFile to write the index to
	 *     ioPriority = The priority for IO operations
	 *     cancellable = An optional #GCancellable or %NULL
	 *     callback = A callback for completion or %NULL
	 *     userData = User data for @callback
	 */
	public void writeAsync(FileIF file, int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		dzl_fuzzy_index_builder_write_async(dzlFuzzyIndexBuilder, (file is null) ? null : file.getFileStruct(), ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/** */
	public bool writeFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto p = dzl_fuzzy_index_builder_write_finish(dzlFuzzyIndexBuilder, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
