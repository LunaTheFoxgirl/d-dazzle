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
module dazzle.ListStoreAdapter;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ListModelIF;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.TreeModelIF;
private import gtk.TreeModelT;


/** */
public class ListStoreAdapter : ObjectG, TreeModelIF
{
	/** the main Gtk struct */
	protected DzlListStoreAdapter* dzlListStoreAdapter;

	/** Get the main Gtk struct */
	public DzlListStoreAdapter* getListStoreAdapterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlListStoreAdapter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlListStoreAdapter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlListStoreAdapter* dzlListStoreAdapter, bool ownedRef = false)
	{
		this.dzlListStoreAdapter = dzlListStoreAdapter;
		super(cast(GObject*)dzlListStoreAdapter, ownedRef);
	}

	// add the TreeModel capabilities
	mixin TreeModelT!(DzlListStoreAdapter);


	/** */
	public static GType getType()
	{
		return dzl_list_store_adapter_get_type();
	}

	/** */
	public this(ListModelIF model)
	{
		auto p = dzl_list_store_adapter_new((model is null) ? null : model.getListModelStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlListStoreAdapter*) p, true);
	}

	/**
	 * Gets the model being adapted.
	 *
	 * Returns: A #GListModel
	 *
	 * Since: 3.26
	 */
	public ListModelIF getModel()
	{
		auto p = dzl_list_store_adapter_get_model(dzlListStoreAdapter);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) p);
	}

	/** */
	public void setModel(ListModelIF model)
	{
		dzl_list_store_adapter_set_model(dzlListStoreAdapter, (model is null) ? null : model.getListModelStruct());
	}
}
