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
module dazzle.DockItemT;

public  import dazzle.DockItemIF;
public  import dazzle.DockManager;
public  import dazzle.c.functions;
public  import dazzle.c.types;
public  import gio.IconIF;
public  import glib.Str;
public  import gobject.ObjectG;
public  import gobject.Signals;
public  import std.algorithm;


/** */
public template DockItemT(TStruct)
{
	/** Get the main Gtk struct */
	public DzlDockItem* getDockItemStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(DzlDockItem*)getStruct();
	}

	static if (is(TStruct == DzlDockWindow)) {
		/**
	 * Gets the icon_name for the #DzlDockItem.
	 *
	 * Generally, you want to use a #DzlDockWidget which has a "icon-name" property
	 * you can set. But this can be helpful for integration of various container
	 * widgets.
	 *
	 * Returns: A newly allocated string or %NULL.
	 */
	public override string getIconName()
	{
		auto retStr = dzl_dock_item_get_icon_name(getDockItemStruct());

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets the title for the #DzlDockItem.
	 *
	 * Generally, you want to use a #DzlDockWidget which has a "title" property you
	 * can set. But this can be helpful for integration of various container
	 * widgets.
	 *
	 * Returns: A newly allocated string or %NULL.
	 */
	public override string getTitle()
	{
		auto retStr = dzl_dock_item_get_title(getDockItemStruct());

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * This widget will walk the widget hierarchy to ensure that the
	 * dock item is visible to the user.
	 */
	public override void present()
	{
		dzl_dock_item_present(getDockItemStruct());
	}
	} else {
	/**
	 * Gets the icon_name for the #DzlDockItem.
	 *
	 * Generally, you want to use a #DzlDockWidget which has a "icon-name" property
	 * you can set. But this can be helpful for integration of various container
	 * widgets.
	 *
	 * Returns: A newly allocated string or %NULL.
	 */
	public string getIconName()
	{
		auto retStr = dzl_dock_item_get_icon_name(getDockItemStruct());

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets the title for the #DzlDockItem.
	 *
	 * Generally, you want to use a #DzlDockWidget which has a "title" property you
	 * can set. But this can be helpful for integration of various container
	 * widgets.
	 *
	 * Returns: A newly allocated string or %NULL.
	 */
	public string getTitle()
	{
		auto retStr = dzl_dock_item_get_title(getDockItemStruct());

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * This widget will walk the widget hierarchy to ensure that the
	 * dock item is visible to the user.
	 */
	public void present()
	{
		dzl_dock_item_present(getDockItemStruct());
	}
}

/**
 */

/** */
public bool adopt(DockItemIF child)
{
	return dzl_dock_item_adopt(getDockItemStruct(), (child is null) ? null : child.getDockItemStruct()) != 0;
}

/**
 * This function will request that the dock item close itself.
 *
 * Returns: %TRUE if the dock item was closed
 */
public bool close()
{
	return dzl_dock_item_close(getDockItemStruct()) != 0;
}

/**
 * Emits the #DzlDockItem::presented signal.
 *
 * Containers should emit this when their descendant has been presented as the
 * current visible child. This allows dock items to do lazy initialization of
 * content once the widgetry is visible to the user.
 *
 * Currently, this is best effort, as there are a number of situations that
 * make covering all cases problematic.
 *
 * Since: 3.30
 */
public void emitPresented()
{
	dzl_dock_item_emit_presented(getDockItemStruct());
}

/**
 * If this dock item can be closed by the user, this virtual function should be
 * implemented by the panel and return %TRUE.
 *
 * Returns: %TRUE if the dock item can be closed by the user, otherwise %FALSE.
 */
public bool getCanClose()
{
	return dzl_dock_item_get_can_close(getDockItemStruct()) != 0;
}

/**
 * Returns: %TRUE if the widget can be minimized.
 */
public bool getCanMinimize()
{
	return dzl_dock_item_get_can_minimize(getDockItemStruct()) != 0;
}

/** */
public bool getChildVisible(DockItemIF child)
{
	return dzl_dock_item_get_child_visible(getDockItemStruct(), (child is null) ? null : child.getDockItemStruct()) != 0;
}

/**
 * Gets the dock manager for this dock item.
 *
 * Returns: A #DzlDockmanager.
 */
public DockManager getManager()
{
	auto p = dzl_dock_item_get_manager(getDockItemStruct());

	if(p is null)
	{
		return null;
	}

	return ObjectG.getDObject!(DockManager)(cast(DzlDockManager*) p);
}

/**
 * Gets the parent #DzlDockItem, or %NULL.
 *
 * Returns: A #DzlDockItem or %NULL.
 */
public DockItemIF getParent()
{
	auto p = dzl_dock_item_get_parent(getDockItemStruct());

	if(p is null)
	{
		return null;
	}

	return ObjectG.getDObject!(DockItemIF)(cast(DzlDockItem*) p);
}

/** */
public bool hasWidgets()
{
	return dzl_dock_item_has_widgets(getDockItemStruct()) != 0;
}

/**
 * This requests that @self minimize @child if it knows how.
 *
 * If not, it should suggest the gravity for @child if it knows how to
 * determine that. For example, a #DzlDockBin might know if the widget was part
 * of the right panel and therefore may set @position to %GTK_POS_RIGHT.
 *
 * Params:
 *     child = A #DzlDockItem that is a child of @self
 *     position = A location for a #GtkPositionType
 *
 * Returns: %TRUE if @child was minimized. Otherwise %FALSE and @position
 *     may be updated to a suggested position.
 */
public bool minimize(DockItemIF child, ref GtkPositionType position)
{
	return dzl_dock_item_minimize(getDockItemStruct(), (child is null) ? null : child.getDockItemStruct(), &position) != 0;
}

/**
 * Emits the "needs-attention" signal.
 *
 * Since: 3.34
 */
public void needsAttention()
{
	dzl_dock_item_needs_attention(getDockItemStruct());
}

/** */
public void presentChild(DockItemIF child)
{
	dzl_dock_item_present_child(getDockItemStruct(), (child is null) ? null : child.getDockItemStruct());
}

/**
 * Gets a #GIcon for the dock item, if any has been set.
 *
 * If an icon-name has been set, a new #GIcon for that icon-name
 * may be returned.
 *
 * Returns: a #GIcon or %NULL
 *
 * Since: 3.34
 */
public IconIF refGicon()
{
	auto p = dzl_dock_item_ref_gicon(getDockItemStruct());

	if(p is null)
	{
		return null;
	}

	return ObjectG.getDObject!(IconIF)(cast(GIcon*) p, true);
}

/**
 * This virtual method should remove @child from @self if the
 * dock item knows how to do so. For example, the #DzlDockStack
 * will remove @child from it's internal #GtkStack.
 *
 * After the virtual function has been executed, child tracking
 * will be removed so that #DzlDockItem implementations do not
 * need to implement themselves.
 */
public void release(DockItemIF child)
{
	dzl_dock_item_release(getDockItemStruct(), (child is null) ? null : child.getDockItemStruct());
}

/** */
public void setChildVisible(DockItemIF child, bool childVisible)
{
	dzl_dock_item_set_child_visible(getDockItemStruct(), (child is null) ? null : child.getDockItemStruct(), childVisible);
}

/**
 * Sets the dock manager for this #DzlDockItem.
 *
 * Params:
 *     manager = A #DzlDockManager
 */
public void setManager(DockManager manager)
{
	dzl_dock_item_set_manager(getDockItemStruct(), (manager is null) ? null : manager.getDockManagerStruct());
}

/** */
public void updateVisibility()
{
	dzl_dock_item_update_visibility(getDockItemStruct());
}

/** */
gulong addOnManagerSet(void delegate(DockManager, DockItemIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
{
	return Signals.connect(this, "manager-set", dlg, connectFlags ^ ConnectFlags.SWAPPED);
}

/** */
gulong addOnNeedsAttention(void delegate(DockItemIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
{
	return Signals.connect(this, "needs-attention", dlg, connectFlags ^ ConnectFlags.SWAPPED);
}

/** */
gulong addOnPresented(void delegate(DockItemIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
{
	return Signals.connect(this, "presented", dlg, connectFlags ^ ConnectFlags.SWAPPED);
}
}
