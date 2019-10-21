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
module dazzle.DockItemIF;

private import dazzle.DockItemIF;
private import dazzle.DockManager;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.IconIF;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import std.algorithm;


/** */
public interface DockItemIF{
	/** Get the main Gtk struct */
	public DzlDockItem* getDockItemStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return dzl_dock_item_get_type();
	}

	/** */
	public bool adopt(DockItemIF child);

	/**
	 * This function will request that the dock item close itself.
	 *
	 * Returns: %TRUE if the dock item was closed
	 */
	public bool close();

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
	public void emitPresented();

	/**
	 * If this dock item can be closed by the user, this virtual function should be
	 * implemented by the panel and return %TRUE.
	 *
	 * Returns: %TRUE if the dock item can be closed by the user, otherwise %FALSE.
	 */
	public bool getCanClose();

	/**
	 * Returns: %TRUE if the widget can be minimized.
	 */
	public bool getCanMinimize();

	/** */
	public bool getChildVisible(DockItemIF child);

	/**
	 * Gets the dock manager for this dock item.
	 *
	 * Returns: A #DzlDockmanager.
	 */
	public DockManager getManager();

	/**
	 * Gets the parent #DzlDockItem, or %NULL.
	 *
	 * Returns: A #DzlDockItem or %NULL.
	 */
	public DockItemIF getParent();

	/** */
	public bool hasWidgets();

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
	public bool minimize(DockItemIF child, ref GtkPositionType position);

	/**
	 * Emits the "needs-attention" signal.
	 *
	 * Since: 3.34
	 */
	public void needsAttention();

	/** */
	public void presentChild(DockItemIF child);

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
	public IconIF refGicon();

	/**
	 * This virtual method should remove @child from @self if the
	 * dock item knows how to do so. For example, the #DzlDockStack
	 * will remove @child from it's internal #GtkStack.
	 *
	 * After the virtual function has been executed, child tracking
	 * will be removed so that #DzlDockItem implementations do not
	 * need to implement themselves.
	 */
	public void release(DockItemIF child);

	/** */
	public void setChildVisible(DockItemIF child, bool childVisible);

	/**
	 * Sets the dock manager for this #DzlDockItem.
	 *
	 * Params:
	 *     manager = A #DzlDockManager
	 */
	public void setManager(DockManager manager);

	/** */
	public void updateVisibility();

	/** */
	gulong addOnManagerSet(void delegate(DockManager, DockItemIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

	/** */
	gulong addOnNeedsAttention(void delegate(DockItemIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

	/** */
	gulong addOnPresented(void delegate(DockItemIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
}
