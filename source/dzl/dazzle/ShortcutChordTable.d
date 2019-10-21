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
module dazzle.ShortcutChordTable;

private import dazzle.ShortcutChord;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtkd.Loader;


/** */
public class ShortcutChordTable
{
	/** the main Gtk struct */
	protected DzlShortcutChordTable* dzlShortcutChordTable;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public DzlShortcutChordTable* getShortcutChordTableStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutChordTable;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)dzlShortcutChordTable;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutChordTable* dzlShortcutChordTable, bool ownedRef = false)
	{
		this.dzlShortcutChordTable = dzlShortcutChordTable;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_DAZZLE) && ownedRef )
			dzl_shortcut_chord_table_free(dzlShortcutChordTable);
	}


	/** */
	public void add(ShortcutChord chord, void* data)
	{
		dzl_shortcut_chord_table_add(dzlShortcutChordTable, (chord is null) ? null : chord.getShortcutChordStruct(), data);
	}

	alias foreac = foreach_;
	/**
	 * This function will call @foreach_func for each chord in the table.
	 *
	 * Params:
	 *     foreachFunc = A callback for each chord
	 *     foreachData = user data for @foreach_func
	 */
	public void foreach_(DzlShortcutChordTableForeach foreachFunc, void* foreachData)
	{
		dzl_shortcut_chord_table_foreach(dzlShortcutChordTable, foreachFunc, foreachData);
	}

	/** */
	public void free()
	{
		dzl_shortcut_chord_table_free(dzlShortcutChordTable);
		ownedRef = false;
	}

	/** */
	public DzlShortcutMatch lookup(ShortcutChord chord, void** data)
	{
		return dzl_shortcut_chord_table_lookup(dzlShortcutChordTable, (chord is null) ? null : chord.getShortcutChordStruct(), data);
	}

	/** */
	public ShortcutChord lookupData(void* data)
	{
		auto p = dzl_shortcut_chord_table_lookup_data(dzlShortcutChordTable, data);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutChord)(cast(DzlShortcutChord*) p);
	}

	/** */
	public void printf()
	{
		dzl_shortcut_chord_table_printf(dzlShortcutChordTable);
	}

	/** */
	public bool remove(ShortcutChord chord)
	{
		return dzl_shortcut_chord_table_remove(dzlShortcutChordTable, (chord is null) ? null : chord.getShortcutChordStruct()) != 0;
	}

	/** */
	public bool removeData(void* data)
	{
		return dzl_shortcut_chord_table_remove_data(dzlShortcutChordTable, data) != 0;
	}

	/** */
	public void setFreeFunc(GDestroyNotify notify)
	{
		dzl_shortcut_chord_table_set_free_func(dzlShortcutChordTable, notify);
	}

	/** */
	public uint size()
	{
		return dzl_shortcut_chord_table_size(dzlShortcutChordTable);
	}

	/** */
	public this()
	{
		auto p = dzl_shortcut_chord_table_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlShortcutChordTable*) p);
	}
}
