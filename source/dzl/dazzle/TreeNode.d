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
module dazzle.TreeNode;

private import dazzle.Tree;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gdk.RGBA;
private import gio.IconIF;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Popover;
private import gtk.TreeIter;
private import gtk.TreePath;


/** */
public class TreeNode : ObjectG
{
	/** the main Gtk struct */
	protected DzlTreeNode* dzlTreeNode;

	/** Get the main Gtk struct */
	public DzlTreeNode* getTreeNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlTreeNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlTreeNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlTreeNode* dzlTreeNode, bool ownedRef = false)
	{
		this.dzlTreeNode = dzlTreeNode;
		super(cast(GObject*)dzlTreeNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_tree_node_get_type();
	}

	/**
	 * Creates a new #DzlTreeNode instance. This is handy for situations where you
	 * do not want to subclass #DzlTreeNode.
	 *
	 * Returns: A #DzlTreeNode
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = dzl_tree_node_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlTreeNode*) p, true);
	}

	/**
	 * Adds an emplem to be rendered on top of the node.
	 *
	 * Use dzl_tree_node_remove_emblem() to remove an emblem.
	 *
	 * Params:
	 *     emblemName = the icon-name of the emblem
	 */
	public void addEmblem(string emblemName)
	{
		dzl_tree_node_add_emblem(dzlTreeNode, Str.toStringz(emblemName));
	}

	/**
	 * Appends @child to the list of children owned by @node.
	 *
	 * Params:
	 *     child = A #DzlTreeNode.
	 */
	public void append(TreeNode child)
	{
		dzl_tree_node_append(dzlTreeNode, (child is null) ? null : child.getTreeNodeStruct());
	}

	/**
	 * Removes all emblems from @self.
	 */
	public void clearEmblems()
	{
		dzl_tree_node_clear_emblems(dzlTreeNode);
	}

	/** */
	public void collapse()
	{
		dzl_tree_node_collapse(dzlTreeNode);
	}

	/** */
	public bool expand(bool expandAncestors)
	{
		return dzl_tree_node_expand(dzlTreeNode, expandAncestors) != 0;
	}

	/** */
	public void getArea(GdkRectangle* area)
	{
		dzl_tree_node_get_area(dzlTreeNode, area);
	}

	/** */
	public bool getChildrenPossible()
	{
		return dzl_tree_node_get_children_possible(dzlTreeNode) != 0;
	}

	/** */
	public bool getExpanded()
	{
		return dzl_tree_node_get_expanded(dzlTreeNode) != 0;
	}

	/**
	 * Gets the foreground-rgba to use for row text.
	 *
	 * If %NULL, the default foreground color should be used.
	 *
	 * Returns: A #GdkRGBA or %NULL
	 *
	 * Since: 3.28
	 */
	public RGBA getForegroundRgba()
	{
		auto p = dzl_tree_node_get_foreground_rgba(dzlTreeNode);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RGBA)(cast(GdkRGBA*) p);
	}

	/**
	 * Fetch the GIcon, re-render if necessary
	 *
	 * Returns: An #GIcon or %NULL.
	 */
	public IconIF getGicon()
	{
		auto p = dzl_tree_node_get_gicon(dzlTreeNode);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconIF)(cast(GIcon*) p);
	}

	/**
	 * Fetches the icon-name of the icon to display, or NULL for no icon.
	 */
	public string getIconName()
	{
		return Str.toString(dzl_tree_node_get_icon_name(dzlTreeNode));
	}

	/**
	 * Gets a #GObject for the node, if one was set.
	 *
	 * Returns: A #GObject or %NULL.
	 */
	public ObjectG getItem()
	{
		auto p = dzl_tree_node_get_item(dzlTreeNode);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ObjectG)(cast(GObject*) p);
	}

	/** */
	public bool getIter(TreeIter iter)
	{
		return dzl_tree_node_get_iter(dzlTreeNode, (iter is null) ? null : iter.getTreeIterStruct()) != 0;
	}

	/**
	 * Retrieves the parent #DzlTreeNode for @node.
	 *
	 * Returns: A #DzlTreeNode.
	 */
	public TreeNode getParent()
	{
		auto p = dzl_tree_node_get_parent(dzlTreeNode);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TreeNode)(cast(DzlTreeNode*) p);
	}

	/**
	 * Gets a #GtkTreePath for @node.
	 *
	 * Returns: A #GtkTreePath if successful; otherwise %NULL.
	 */
	public TreePath getPath()
	{
		auto p = dzl_tree_node_get_path(dzlTreeNode);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TreePath)(cast(GtkTreePath*) p, true);
	}

	/** */
	public bool getResetOnCollapse()
	{
		return dzl_tree_node_get_reset_on_collapse(dzlTreeNode) != 0;
	}

	/** */
	public string getText()
	{
		return Str.toString(dzl_tree_node_get_text(dzlTreeNode));
	}

	/**
	 * Fetches the #DzlTree instance that owns the node.
	 *
	 * Returns: A #DzlTree.
	 */
	public Tree getTree()
	{
		auto p = dzl_tree_node_get_tree(dzlTreeNode);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Tree)(cast(DzlTree*) p);
	}

	/** */
	public bool getUseDimLabel()
	{
		return dzl_tree_node_get_use_dim_label(dzlTreeNode) != 0;
	}

	/** */
	public bool getUseMarkup()
	{
		return dzl_tree_node_get_use_markup(dzlTreeNode) != 0;
	}

	/**
	 * Checks to see if @emblem_name has been added to the #DzlTreeNode.
	 *
	 * Params:
	 *     emblemName = a string containing the emblem name
	 *
	 * Returns: %TRUE if @emblem_name is used by @self
	 */
	public bool hasEmblem(string emblemName)
	{
		return dzl_tree_node_has_emblem(dzlTreeNode, Str.toStringz(emblemName)) != 0;
	}

	/**
	 * Inserts @child as a child of @self at @position.
	 *
	 * Params:
	 *     child = a #DzlTreeNode
	 *     position = the position for the child
	 *
	 * Since: 3.28
	 */
	public void insert(TreeNode child, uint position)
	{
		dzl_tree_node_insert(dzlTreeNode, (child is null) ? null : child.getTreeNodeStruct(), position);
	}

	/**
	 * Inserts a @child as a child of @node, sorting it among the other children.
	 *
	 * Params:
	 *     child = A #DzlTreeNode.
	 *     compareFunc = A compare func to compare nodes.
	 *     userData = user data for @compare_func.
	 */
	public void insertSorted(TreeNode child, DzlTreeNodeCompareFunc compareFunc, void* userData)
	{
		dzl_tree_node_insert_sorted(dzlTreeNode, (child is null) ? null : child.getTreeNodeStruct(), compareFunc, userData);
	}

	/** */
	public void invalidate()
	{
		dzl_tree_node_invalidate(dzlTreeNode);
	}

	/** */
	public bool isRoot()
	{
		return dzl_tree_node_is_root(dzlTreeNode) != 0;
	}

	/** */
	public uint nChildren()
	{
		return dzl_tree_node_n_children(dzlTreeNode);
	}

	/**
	 * Gets the @nth child of @self or %NULL if it does not exist.
	 *
	 * Params:
	 *     nth = the index of the child
	 *
	 * Returns: a #DzlTreeNode or %NULL
	 */
	public TreeNode nthChild(uint nth)
	{
		auto p = dzl_tree_node_nth_child(dzlTreeNode, nth);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TreeNode)(cast(DzlTreeNode*) p, true);
	}

	/**
	 * Prepends @child to the list of children owned by @node.
	 *
	 * Params:
	 *     child = A #DzlTreeNode.
	 */
	public void prepend(TreeNode child)
	{
		dzl_tree_node_prepend(dzlTreeNode, (child is null) ? null : child.getTreeNodeStruct());
	}

	/**
	 * Rebuilds a node, without invalidating children nodes. If you want to
	 * ensure that children are also rebuilt, use dzl_tree_node_invalidate().
	 *
	 * Since: 3.28
	 */
	public void rebuild()
	{
		dzl_tree_node_rebuild(dzlTreeNode);
	}

	/**
	 * Removes @child from the list of children owned by @node.
	 *
	 * Params:
	 *     child = A #DzlTreeNode.
	 */
	public void remove(TreeNode child)
	{
		dzl_tree_node_remove(dzlTreeNode, (child is null) ? null : child.getTreeNodeStruct());
	}

	/** */
	public void removeEmblem(string emblemName)
	{
		dzl_tree_node_remove_emblem(dzlTreeNode, Str.toStringz(emblemName));
	}

	/** */
	public void select()
	{
		dzl_tree_node_select(dzlTreeNode);
	}

	/**
	 * If the node has not yet been built, setting this to %TRUE will add a
	 * dummy child node. This dummy node will be removed when when the node
	 * is built by the registered #DzlTreeBuilder instances.
	 *
	 * Params:
	 *     childrenPossible = If the node has children.
	 */
	public void setChildrenPossible(bool childrenPossible)
	{
		dzl_tree_node_set_children_possible(dzlTreeNode, childrenPossible);
	}

	/** */
	public void setEmblems(string emblems)
	{
		dzl_tree_node_set_emblems(dzlTreeNode, Str.toStringz(emblems));
	}

	/**
	 * Sets the foreground-rgba to be used by the row text.
	 *
	 * If @foreground_rgba is %NULL, the value is reset to the default.
	 *
	 * Params:
	 *     foregroundRgba = A #GdkRGBA or %NULL
	 *
	 * Since: 3.28
	 */
	public void setForegroundRgba(RGBA foregroundRgba)
	{
		dzl_tree_node_set_foreground_rgba(dzlTreeNode, (foregroundRgba is null) ? null : foregroundRgba.getRGBAStruct());
	}

	/** */
	public void setGicon(IconIF icon)
	{
		dzl_tree_node_set_gicon(dzlTreeNode, (icon is null) ? null : icon.getIconStruct());
	}

	/**
	 * Sets the icon name of the node. This is displayed in the pixbuf
	 * cell of the DzlTree.
	 *
	 * Params:
	 *     iconName = The icon name.
	 */
	public void setIconName(string iconName)
	{
		dzl_tree_node_set_icon_name(dzlTreeNode, Str.toStringz(iconName));
	}

	/**
	 * An optional object to associate with the node. This is handy to save needing
	 * to subclass the #DzlTreeNode class.
	 *
	 * Params:
	 *     item = A #GObject.
	 */
	public void setItem(ObjectG item)
	{
		dzl_tree_node_set_item(dzlTreeNode, (item is null) ? null : item.getObjectGStruct());
	}

	/** */
	public void setResetOnCollapse(bool resetOnCollapse)
	{
		dzl_tree_node_set_reset_on_collapse(dzlTreeNode, resetOnCollapse);
	}

	/**
	 * Sets the text of the node. This is displayed in the text
	 * cell of the DzlTree.
	 *
	 * Params:
	 *     text = The node text.
	 */
	public void setText(string text)
	{
		dzl_tree_node_set_text(dzlTreeNode, Str.toStringz(text));
	}

	/** */
	public void setUseDimLabel(bool useDimLabel)
	{
		dzl_tree_node_set_use_dim_label(dzlTreeNode, useDimLabel);
	}

	/** */
	public void setUseMarkup(bool useMarkup)
	{
		dzl_tree_node_set_use_markup(dzlTreeNode, useMarkup);
	}

	/** */
	public void showPopover(Popover popover)
	{
		dzl_tree_node_show_popover(dzlTreeNode, (popover is null) ? null : popover.getPopoverStruct());
	}
}
