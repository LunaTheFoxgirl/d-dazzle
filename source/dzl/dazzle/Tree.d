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
module dazzle.Tree;

private import dazzle.TreeBuilder;
private import dazzle.TreeNode;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.MenuModel;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ScrollableIF;
private import gtk.ScrollableT;
private import gtk.TreeView;
private import gtk.Widget;
private import std.algorithm;


/** */
public class Tree : TreeView
{
	/** the main Gtk struct */
	protected DzlTree* dzlTree;

	/** Get the main Gtk struct */
	public DzlTree* getTreeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlTree;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlTree;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlTree* dzlTree, bool ownedRef = false)
	{
		this.dzlTree = dzlTree;
		super(cast(GtkTreeView*)dzlTree, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_tree_get_type();
	}

	/**
	 * Add a builder to the tree.
	 *
	 * Params:
	 *     builder = A #DzlTreeBuilder to add.
	 */
	public void addBuilder(TreeBuilder builder)
	{
		dzl_tree_add_builder(dzlTree, (builder is null) ? null : builder.getTreeBuilderStruct());
	}

	/** */
	public void expandToNode(TreeNode node)
	{
		dzl_tree_expand_to_node(dzlTree, (node is null) ? null : node.getTreeNodeStruct());
	}

	/**
	 * Searches through the direct children of @node for a matching child.
	 * @find_func should return %TRUE if the child matches, otherwise %FALSE.
	 *
	 * Params:
	 *     node = A #DzlTreeNode
	 *     findFunc = A callback to locate the child
	 *     userData = user data for @find_func
	 *
	 * Returns: A #DzlTreeNode or %NULL.
	 */
	public TreeNode findChildNode(TreeNode node, DzlTreeFindFunc findFunc, void* userData)
	{
		auto p = dzl_tree_find_child_node(dzlTree, (node is null) ? null : node.getTreeNodeStruct(), findFunc, userData);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TreeNode)(cast(DzlTreeNode*) p);
	}

	/**
	 * Walks the entire tree looking for the first item that matches given
	 * @equal_func and @key.
	 *
	 * The first parameter to @equal_func will always be @key.
	 * The second parameter will be the nodes #DzlTreeNode:item property.
	 *
	 * Params:
	 *     equalFunc = A #GEqualFunc
	 *     key = the key for @equal_func
	 *
	 * Returns: A #DzlTreeNode or %NULL.
	 */
	public TreeNode findCustom(GEqualFunc equalFunc, void* key)
	{
		auto p = dzl_tree_find_custom(dzlTree, equalFunc, key);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TreeNode)(cast(DzlTreeNode*) p);
	}

	/**
	 * Finds a #DzlTreeNode with an item property matching @item.
	 *
	 * Params:
	 *     item = A #GObject or %NULL.
	 *
	 * Returns: A #DzlTreeNode or %NULL.
	 */
	public TreeNode findItem(ObjectG item)
	{
		auto p = dzl_tree_find_item(dzlTree, (item is null) ? null : item.getObjectGStruct());

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TreeNode)(cast(DzlTreeNode*) p);
	}

	/**
	 * Returns: A #GMenuModel or %NULL.
	 */
	public MenuModel getContextMenu()
	{
		auto p = dzl_tree_get_context_menu(dzlTree);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MenuModel)(cast(GMenuModel*) p);
	}

	/**
	 * Retrieves the root node of the tree. The root node is not a visible node
	 * in the self, but a placeholder for all other builders to build upon.
	 *
	 * Returns: A #DzlTreeNode or %NULL.
	 */
	public TreeNode getRoot()
	{
		auto p = dzl_tree_get_root(dzlTree);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TreeNode)(cast(DzlTreeNode*) p);
	}

	/**
	 * Gets the currently selected node in the tree.
	 *
	 * Returns: A #DzlTreeNode.
	 */
	public TreeNode getSelected()
	{
		auto p = dzl_tree_get_selected(dzlTree);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TreeNode)(cast(DzlTreeNode*) p);
	}

	/** */
	public bool getShowIcons()
	{
		return dzl_tree_get_show_icons(dzlTree) != 0;
	}

	/** */
	public void rebuild()
	{
		dzl_tree_rebuild(dzlTree);
	}

	/**
	 * Removes a builder from the tree.
	 *
	 * Params:
	 *     builder = A #DzlTreeBuilder to remove.
	 */
	public void removeBuilder(TreeBuilder builder)
	{
		dzl_tree_remove_builder(dzlTree, (builder is null) ? null : builder.getTreeBuilderStruct());
	}

	/** */
	public void scrollToNode(TreeNode node)
	{
		dzl_tree_scroll_to_node(dzlTree, (node is null) ? null : node.getTreeNodeStruct());
	}

	/** */
	public void setContextMenu(MenuModel contextMenu)
	{
		dzl_tree_set_context_menu(dzlTree, (contextMenu is null) ? null : contextMenu.getMenuModelStruct());
	}

	/**
	 * Sets the filter function to be used to determine visability of a tree node.
	 *
	 * Params:
	 *     filterFunc = A callback to determien visibility.
	 *     filterData = User data for @filter_func.
	 *     filterDataDestroy = Destroy notify for @filter_data.
	 */
	public void setFilter(DzlTreeFilterFunc filterFunc, void* filterData, GDestroyNotify filterDataDestroy)
	{
		dzl_tree_set_filter(dzlTree, filterFunc, filterData, filterDataDestroy);
	}

	/**
	 * Sets the root node of the #DzlTree widget. This is used to build
	 * the items within the treeview. The item itself will not be added
	 * to the self, but the direct children will be.
	 *
	 * Params:
	 *     node = A #DzlTreeNode.
	 */
	public void setRoot(TreeNode node)
	{
		dzl_tree_set_root(dzlTree, (node is null) ? null : node.getTreeNodeStruct());
	}

	/** */
	public void setShowIcons(bool showIcons)
	{
		dzl_tree_set_show_icons(dzlTree, showIcons);
	}

	/**
	 * Unselects the currently selected node in the tree.
	 */
	public void unselectAll()
	{
		dzl_tree_unselect_all(dzlTree);
	}

	/** */
	gulong addOnAction(void delegate(string, string, string, Tree) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "action", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnPopulatePopup(void delegate(Widget, Tree) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "populate-popup", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
