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
module dazzle.PreferencesGroup;

private import dazzle.PatternSpec;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.HashTable;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.SizeGroup;
private import gtk.Widget;


/** */
public class PreferencesGroup : Bin
{
	/** the main Gtk struct */
	protected DzlPreferencesGroup* dzlPreferencesGroup;

	/** Get the main Gtk struct */
	public DzlPreferencesGroup* getPreferencesGroupStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPreferencesGroup;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPreferencesGroup;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPreferencesGroup* dzlPreferencesGroup, bool ownedRef = false)
	{
		this.dzlPreferencesGroup = dzlPreferencesGroup;
		super(cast(GtkBin*)dzlPreferencesGroup, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_preferences_group_get_type();
	}

	/** */
	public override void add(Widget widget)
	{
		dzl_preferences_group_add(dzlPreferencesGroup, (widget is null) ? null : widget.getWidgetStruct());
	}

	/** */
	public int getPriority()
	{
		return dzl_preferences_group_get_priority(dzlPreferencesGroup);
	}

	/**
	 * Gets a size group that can be used to organize items in
	 * a group based on columns.
	 *
	 * Returns: a #GtkSizeGroup
	 */
	public SizeGroup getSizeGroup(uint column)
	{
		auto p = dzl_preferences_group_get_size_group(dzlPreferencesGroup, column);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SizeGroup)(cast(GtkSizeGroup*) p);
	}

	/** */
	public string getTitle()
	{
		return Str.toString(dzl_preferences_group_get_title(dzlPreferencesGroup));
	}

	/** */
	public uint refilter(PatternSpec spec)
	{
		return dzl_preferences_group_refilter(dzlPreferencesGroup, (spec is null) ? null : spec.getPatternSpecStruct());
	}

	/** */
	public void setMap(HashTable map)
	{
		dzl_preferences_group_set_map(dzlPreferencesGroup, (map is null) ? null : map.getHashTableStruct());
	}
}
