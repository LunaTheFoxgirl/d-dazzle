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
module dazzle.SuggestionEntryBuffer;

private import dazzle.Suggestion;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.EntryBuffer;


/** */
public class SuggestionEntryBuffer : EntryBuffer
{
	/** the main Gtk struct */
	protected DzlSuggestionEntryBuffer* dzlSuggestionEntryBuffer;

	/** Get the main Gtk struct */
	public DzlSuggestionEntryBuffer* getSuggestionEntryBufferStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlSuggestionEntryBuffer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlSuggestionEntryBuffer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlSuggestionEntryBuffer* dzlSuggestionEntryBuffer, bool ownedRef = false)
	{
		this.dzlSuggestionEntryBuffer = dzlSuggestionEntryBuffer;
		super(cast(GtkEntryBuffer*)dzlSuggestionEntryBuffer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_suggestion_entry_buffer_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_suggestion_entry_buffer_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlSuggestionEntryBuffer*) p, true);
	}

	/** */
	public void clear()
	{
		dzl_suggestion_entry_buffer_clear(dzlSuggestionEntryBuffer);
	}

	/** */
	public void commit()
	{
		dzl_suggestion_entry_buffer_commit(dzlSuggestionEntryBuffer);
	}

	/**
	 * Gets the #DzlSuggestion that is the current "preview suffix" of the
	 * text in the entry.
	 *
	 * Returns: An #DzlSuggestion or %NULL.
	 */
	public Suggestion getSuggestion()
	{
		auto p = dzl_suggestion_entry_buffer_get_suggestion(dzlSuggestionEntryBuffer);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Suggestion)(cast(DzlSuggestion*) p);
	}

	/** */
	public uint getTypedLength()
	{
		return dzl_suggestion_entry_buffer_get_typed_length(dzlSuggestionEntryBuffer);
	}

	/** */
	public string getTypedText()
	{
		return Str.toString(dzl_suggestion_entry_buffer_get_typed_text(dzlSuggestionEntryBuffer));
	}

	/**
	 * Sets the current suggestion for the entry buffer.
	 *
	 * The suggestion is used to get a potential suffix for the current entry
	 * text. This allows the entry to show "preview text" after the entered
	 * text for what might be inserted should they activate the current item.
	 *
	 * Params:
	 *     suggestion = An #DzlSuggestion or %NULL
	 */
	public void setSuggestion(Suggestion suggestion)
	{
		dzl_suggestion_entry_buffer_set_suggestion(dzlSuggestionEntryBuffer, (suggestion is null) ? null : suggestion.getSuggestionStruct());
	}
}
