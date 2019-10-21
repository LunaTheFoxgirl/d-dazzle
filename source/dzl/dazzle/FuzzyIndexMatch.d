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
module dazzle.FuzzyIndexMatch;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.Str;
private import glib.Variant;
private import gobject.ObjectG;


/** */
public class FuzzyIndexMatch : ObjectG
{
	/** the main Gtk struct */
	protected DzlFuzzyIndexMatch* dzlFuzzyIndexMatch;

	/** Get the main Gtk struct */
	public DzlFuzzyIndexMatch* getFuzzyIndexMatchStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlFuzzyIndexMatch;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlFuzzyIndexMatch;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlFuzzyIndexMatch* dzlFuzzyIndexMatch, bool ownedRef = false)
	{
		this.dzlFuzzyIndexMatch = dzlFuzzyIndexMatch;
		super(cast(GObject*)dzlFuzzyIndexMatch, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_fuzzy_index_match_get_type();
	}

	/**
	 * Returns: A #GVariant.
	 */
	public Variant getDocument()
	{
		auto p = dzl_fuzzy_index_match_get_document(dzlFuzzyIndexMatch);

		if(p is null)
		{
			return null;
		}

		return new Variant(cast(GVariant*) p);
	}

	/** */
	public string getKey()
	{
		return Str.toString(dzl_fuzzy_index_match_get_key(dzlFuzzyIndexMatch));
	}

	/** */
	public uint getPriority()
	{
		return dzl_fuzzy_index_match_get_priority(dzlFuzzyIndexMatch);
	}

	/** */
	public float getScore()
	{
		return dzl_fuzzy_index_match_get_score(dzlFuzzyIndexMatch);
	}
}
