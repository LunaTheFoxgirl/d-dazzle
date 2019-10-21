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
module dazzle.DockRevealer;

private import dazzle.Bin;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Widget;


/**
 * This widget is a bit like #GtkRevealer with a couple of important
 * differences. First, it only supports a couple transition types
 * (the direction to slide reveal). Additionally, the size of the
 * child allocation will not change during the animation. This is not
 * as generally useful as an upstream GTK+ widget, but is extremely
 * important for the panel case to avoid things looking strange while
 * animating into and out of view.
 */
public class DockRevealer : Bin
{
	/** the main Gtk struct */
	protected DzlDockRevealer* dzlDockRevealer;

	/** Get the main Gtk struct */
	public DzlDockRevealer* getDockRevealerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDockRevealer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDockRevealer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDockRevealer* dzlDockRevealer, bool ownedRef = false)
	{
		this.dzlDockRevealer = dzlDockRevealer;
		super(cast(DzlBin*)dzlDockRevealer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_dock_revealer_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_dock_revealer_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlDockRevealer*) p);
	}

	/** */
	public void animateToPosition(int position, uint transitionDuration)
	{
		dzl_dock_revealer_animate_to_position(dzlDockRevealer, position, transitionDuration);
	}

	/** */
	public bool getChildRevealed()
	{
		return dzl_dock_revealer_get_child_revealed(dzlDockRevealer) != 0;
	}

	/** */
	public int getPosition()
	{
		return dzl_dock_revealer_get_position(dzlDockRevealer);
	}

	/** */
	public bool getPositionSet()
	{
		return dzl_dock_revealer_get_position_set(dzlDockRevealer) != 0;
	}

	/** */
	public bool getRevealChild()
	{
		return dzl_dock_revealer_get_reveal_child(dzlDockRevealer) != 0;
	}

	/** */
	public uint getTransitionDuration()
	{
		return dzl_dock_revealer_get_transition_duration(dzlDockRevealer);
	}

	/** */
	public DzlDockRevealerTransitionType getTransitionType()
	{
		return dzl_dock_revealer_get_transition_type(dzlDockRevealer);
	}

	/**
	 * This is a helper to check if the revealer is animating. You probably don't
	 * want to poll this function. Connect to notify::child-revealed or
	 * notify::reveal-child instead.
	 *
	 * Returns: %TRUE if an animation is in progress.
	 */
	public bool isAnimating()
	{
		return dzl_dock_revealer_is_animating(dzlDockRevealer) != 0;
	}

	/** */
	public void setPosition(int position)
	{
		dzl_dock_revealer_set_position(dzlDockRevealer, position);
	}

	/** */
	public void setPositionSet(bool positionSet)
	{
		dzl_dock_revealer_set_position_set(dzlDockRevealer, positionSet);
	}

	/** */
	public void setRevealChild(bool revealChild)
	{
		dzl_dock_revealer_set_reveal_child(dzlDockRevealer, revealChild);
	}

	/** */
	public void setTransitionDuration(uint transitionDuration)
	{
		dzl_dock_revealer_set_transition_duration(dzlDockRevealer, transitionDuration);
	}

	/** */
	public void setTransitionType(DzlDockRevealerTransitionType transitionType)
	{
		dzl_dock_revealer_set_transition_type(dzlDockRevealer, transitionType);
	}
}
