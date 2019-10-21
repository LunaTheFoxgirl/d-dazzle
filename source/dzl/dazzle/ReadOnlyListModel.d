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
module dazzle.ReadOnlyListModel;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class ReadOnlyListModel : ObjectG, ListModelIF
{
	/** the main Gtk struct */
	protected DzlReadOnlyListModel* dzlReadOnlyListModel;

	/** Get the main Gtk struct */
	public DzlReadOnlyListModel* getReadOnlyListModelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlReadOnlyListModel;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlReadOnlyListModel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlReadOnlyListModel* dzlReadOnlyListModel, bool ownedRef = false)
	{
		this.dzlReadOnlyListModel = dzlReadOnlyListModel;
		super(cast(GObject*)dzlReadOnlyListModel, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(DzlReadOnlyListModel);


	/** */
	public static GType getType()
	{
		return dzl_read_only_list_model_get_type();
	}

	/**
	 * Creates a new #DzlReadOnlyListModel which is a read-only wrapper around
	 * @base_model. This is useful when you want to give API consumers access to
	 * a #GListModel but without the ability to mutate the underlying list.
	 *
	 * Params:
	 *     baseModel = a #GListModel
	 *
	 * Returns: a #DzlReadOnlyListModel
	 *
	 * Since: 3.30
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListModelIF baseModel)
	{
		auto p = dzl_read_only_list_model_new((baseModel is null) ? null : baseModel.getListModelStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlReadOnlyListModel*) p, true);
	}
}
