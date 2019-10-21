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
module dazzle.PatternSpec;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtkd.Loader;


/** */
public class PatternSpec
{
	/** the main Gtk struct */
	protected DzlPatternSpec* dzlPatternSpec;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public DzlPatternSpec* getPatternSpecStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPatternSpec;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)dzlPatternSpec;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPatternSpec* dzlPatternSpec, bool ownedRef = false)
	{
		this.dzlPatternSpec = dzlPatternSpec;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_DAZZLE) && ownedRef )
			dzl_pattern_spec_unref(dzlPatternSpec);
	}


	/** */
	public static GType getType()
	{
		return dzl_pattern_spec_get_type();
	}

	/** */
	public this(string keywords)
	{
		auto p = dzl_pattern_spec_new(Str.toStringz(keywords));

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlPatternSpec*) p);
	}

	/** */
	public string getText()
	{
		return Str.toString(dzl_pattern_spec_get_text(dzlPatternSpec));
	}

	/** */
	public bool match(string haystack)
	{
		return dzl_pattern_spec_match(dzlPatternSpec, Str.toStringz(haystack)) != 0;
	}

	alias doref = ref_;
	/** */
	public PatternSpec ref_()
	{
		auto p = dzl_pattern_spec_ref(dzlPatternSpec);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PatternSpec)(cast(DzlPatternSpec*) p, true);
	}

	/** */
	public void unref()
	{
		dzl_pattern_spec_unref(dzlPatternSpec);
	}
}
