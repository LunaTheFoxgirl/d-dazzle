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
module dazzle.ListBox;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ListModelIF;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ListBox : GtkListBoxEx = ListBox;
private import gtk.Widget;


/** */
public class ListBox : GtkListBoxEx
{
	/** the main Gtk struct */
	protected DzlListBox* dzlListBox;

	/** Get the main Gtk struct */
	public DzlListBox* getDazzleListBoxStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlListBox;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlListBox;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlListBox* dzlListBox, bool ownedRef = false)
	{
		this.dzlListBox = dzlListBox;
		super(cast(GtkListBox*)dzlListBox, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_list_box_get_type();
	}

	/** */
	public this(GType rowType, string propertyName)
	{
		auto p = dzl_list_box_new(rowType, Str.toStringz(propertyName));

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlListBox*) p);
	}

	/**
	 * Returns: A #GListModel or %NULL.
	 */
	public ListModelIF getModel()
	{
		auto p = dzl_list_box_get_model(dzlListBox);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) p);
	}

	/** */
	public string getPropertyName()
	{
		return Str.toString(dzl_list_box_get_property_name(dzlListBox));
	}

	/** */
	public GType getRowType()
	{
		return dzl_list_box_get_row_type(dzlListBox);
	}

	/** */
	public void setModel(ListModelIF model)
	{
		dzl_list_box_set_model(dzlListBox, (model is null) ? null : model.getListModelStruct());
	}

	/**
	 * Sets the max number of rows to cache for reuse.  Set to 0 to return
	 * to the default.
	 *
	 * Params:
	 *     recycleMax = max number of rows to cache
	 *
	 * Since: 3.28
	 */
	public void setRecycleMax(uint recycleMax)
	{
		dzl_list_box_set_recycle_max(dzlListBox, recycleMax);
	}
}
