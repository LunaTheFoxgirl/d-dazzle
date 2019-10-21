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
module dazzle.StackList;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ListModelIF;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ListBoxRow;
private import gtk.Widget;
private import std.algorithm;


/** */
public class StackList : Bin
{
	/** the main Gtk struct */
	protected DzlStackList* dzlStackList;

	/** Get the main Gtk struct */
	public DzlStackList* getStackListStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlStackList;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlStackList;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlStackList* dzlStackList, bool ownedRef = false)
	{
		this.dzlStackList = dzlStackList;
		super(cast(GtkBin*)dzlStackList, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_stack_list_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_stack_list_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlStackList*) p);
	}

	/** */
	public void clear()
	{
		dzl_stack_list_clear(dzlStackList);
	}

	/** */
	public uint getDepth()
	{
		return dzl_stack_list_get_depth(dzlStackList);
	}

	/**
	 * Returns: An #DzlStackList.
	 */
	public ListModelIF getModel()
	{
		auto p = dzl_stack_list_get_model(dzlStackList);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) p);
	}

	/** */
	public void pop()
	{
		dzl_stack_list_pop(dzlStackList);
	}

	/** */
	public void push(Widget header, ListModelIF model, DzlStackListCreateWidgetFunc createWidgetFunc, void* userData, GDestroyNotify userDataFreeFunc)
	{
		dzl_stack_list_push(dzlStackList, (header is null) ? null : header.getWidgetStruct(), (model is null) ? null : model.getListModelStruct(), createWidgetFunc, userData, userDataFreeFunc);
	}

	/** */
	gulong addOnHeaderActivated(void delegate(ListBoxRow, StackList) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "header-activated", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnRowActivated(void delegate(ListBoxRow, StackList) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "row-activated", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
