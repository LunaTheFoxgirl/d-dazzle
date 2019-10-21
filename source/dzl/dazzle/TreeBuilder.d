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
module dazzle.TreeBuilder;

private import dazzle.Tree;
private import dazzle.TreeNode;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.Menu;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.SelectionData;
private import std.algorithm;


/** */
public class TreeBuilder : ObjectG
{
	/** the main Gtk struct */
	protected DzlTreeBuilder* dzlTreeBuilder;

	/** Get the main Gtk struct */
	public DzlTreeBuilder* getTreeBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlTreeBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlTreeBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlTreeBuilder* dzlTreeBuilder, bool ownedRef = false)
	{
		this.dzlTreeBuilder = dzlTreeBuilder;
		super(cast(GObject*)dzlTreeBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_tree_builder_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_tree_builder_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlTreeBuilder*) p);
	}

	/**
	 * Gets the tree that owns the builder.
	 *
	 * Returns: A #DzlTree or %NULL.
	 */
	public Tree getTree()
	{
		auto p = dzl_tree_builder_get_tree(dzlTreeBuilder);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Tree)(cast(DzlTree*) p);
	}

	/** */
	gulong addOnAdded(void delegate(Tree, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "added", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnBuildChildren(void delegate(TreeNode, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "build-children", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnBuildNode(void delegate(TreeNode, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "build-node", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnDragDataGet(bool delegate(TreeNode, SelectionData, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "drag-data-get", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnDragDataReceived(bool delegate(TreeNode, DzlTreeDropPosition, GdkDragAction, SelectionData, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "drag-data-received", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnDragNodeDelete(bool delegate(TreeNode, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "drag-node-delete", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnDragNodeReceived(bool delegate(TreeNode, TreeNode, DzlTreeDropPosition, GdkDragAction, SelectionData, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "drag-node-received", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnNodeActivated(bool delegate(TreeNode, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "node-activated", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnNodeCollapsed(void delegate(TreeNode, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "node-collapsed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnNodeDraggable(bool delegate(TreeNode, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "node-draggable", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnNodeDroppable(bool delegate(TreeNode, SelectionData, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "node-droppable", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnNodeExpanded(void delegate(TreeNode, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "node-expanded", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnNodePopup(void delegate(TreeNode, Menu, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "node-popup", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnNodeSelected(void delegate(TreeNode, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "node-selected", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnNodeUnselected(void delegate(TreeNode, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "node-unselected", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnRemoved(void delegate(Tree, TreeBuilder) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "removed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
