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
module dazzle.ShortcutChord;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtkd.Loader;


/** */
public class ShortcutChord
{
	/** the main Gtk struct */
	protected DzlShortcutChord* dzlShortcutChord;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public DzlShortcutChord* getShortcutChordStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutChord;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)dzlShortcutChord;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutChord* dzlShortcutChord, bool ownedRef = false)
	{
		this.dzlShortcutChord = dzlShortcutChord;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_DAZZLE) && ownedRef )
			dzl_shortcut_chord_free(dzlShortcutChord);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcut_chord_get_type();
	}

	/** */
	public this(GdkEventKey* event)
	{
		auto p = dzl_shortcut_chord_new_from_event(event);

		if(p is null)
		{
			throw new ConstructionException("null returned by new_from_event");
		}

		this(cast(DzlShortcutChord*) p);
	}

	/** */
	public this(string accelerator)
	{
		auto p = dzl_shortcut_chord_new_from_string(Str.toStringz(accelerator));

		if(p is null)
		{
			throw new ConstructionException("null returned by new_from_string");
		}

		this(cast(DzlShortcutChord*) p);
	}

	/** */
	public bool appendEvent(GdkEventKey* event)
	{
		return dzl_shortcut_chord_append_event(dzlShortcutChord, event) != 0;
	}

	/** */
	public ShortcutChord copy()
	{
		auto p = dzl_shortcut_chord_copy(dzlShortcutChord);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutChord)(cast(DzlShortcutChord*) p, true);
	}

	/** */
	public void free()
	{
		dzl_shortcut_chord_free(dzlShortcutChord);
		ownedRef = false;
	}

	/** */
	public string getLabel()
	{
		auto retStr = dzl_shortcut_chord_get_label(dzlShortcutChord);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/** */
	public uint getLength()
	{
		return dzl_shortcut_chord_get_length(dzlShortcutChord);
	}

	/** */
	public void getNthKey(uint nth, uint* keyval, GdkModifierType* modifier)
	{
		dzl_shortcut_chord_get_nth_key(dzlShortcutChord, nth, keyval, modifier);
	}

	/** */
	public bool hasModifier()
	{
		return dzl_shortcut_chord_has_modifier(dzlShortcutChord) != 0;
	}

	/** */
	public DzlShortcutMatch match(ShortcutChord other)
	{
		return dzl_shortcut_chord_match(dzlShortcutChord, (other is null) ? null : other.getShortcutChordStruct());
	}

	/** */
	public override string toString()
	{
		auto retStr = dzl_shortcut_chord_to_string(dzlShortcutChord);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/** */
	public static bool equal(void* data1, void* data2)
	{
		return dzl_shortcut_chord_equal(data1, data2) != 0;
	}

	/** */
	public static uint hash(void* data)
	{
		return dzl_shortcut_chord_hash(data);
	}
}
