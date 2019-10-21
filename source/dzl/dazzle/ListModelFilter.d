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
module dazzle.ListModelFilter;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class ListModelFilter : ObjectG, ListModelIF
{
	/** the main Gtk struct */
	protected DzlListModelFilter* dzlListModelFilter;

	/** Get the main Gtk struct */
	public DzlListModelFilter* getListModelFilterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlListModelFilter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlListModelFilter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlListModelFilter* dzlListModelFilter, bool ownedRef = false)
	{
		this.dzlListModelFilter = dzlListModelFilter;
		super(cast(GObject*)dzlListModelFilter, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(DzlListModelFilter);


	/** */
	public static GType getType()
	{
		return dzl_list_model_filter_get_type();
	}

	/** */
	public this(ListModelIF childModel)
	{
		auto p = dzl_list_model_filter_new((childModel is null) ? null : childModel.getListModelStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlListModelFilter*) p, true);
	}

	/**
	 * Gets the child model that is being filtered.
	 *
	 * Returns: A #GListModel.
	 */
	public ListModelIF getChildModel()
	{
		auto p = dzl_list_model_filter_get_child_model(dzlListModelFilter);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) p);
	}

	/** */
	public void invalidate()
	{
		dzl_list_model_filter_invalidate(dzlListModelFilter);
	}

	/** */
	public void setFilterFunc(DzlListModelFilterFunc filterFunc, void* filterFuncData, GDestroyNotify filterFuncDataDestroy)
	{
		dzl_list_model_filter_set_filter_func(dzlListModelFilter, filterFunc, filterFuncData, filterFuncDataDestroy);
	}
}
