(*
 * Graph: generic graph library
 * Copyright (C) 2004
 * Sylvain Conchon, Jean-Christophe Filliatre and Julien Signoles
 * 
 * This software is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License version 2, as published by the Free Software Foundation.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * 
 * See the GNU Library General Public License version 2 for more details
 * (enclosed in the file LGPL).
 *)

(* $Id: builder.mli,v 1.13 2004-02-20 14:37:40 signoles Exp $ *)

(** Graph builders *)

open Sig

(** {1 Common interface for graph builders}.

   Note: the following functions always return graphs but this is meaningless
   for imperative implementations (the graph is modified in-place).  
   This is just to provide a common interface. *)

module type S = sig
  module G : Sig.G
  val empty : unit -> G.t
  val copy : G.t -> G.t
  val add_vertex : G.t -> G.V.t -> G.t
  val add_edge : G.t -> G.V.t -> G.V.t -> G.t
  val add_edge_e : G.t -> G.E.t -> G.t
end

module type INT = S with type G.V.label = int

(** {1 Builders for the various graph implementations} *)

module P(G : Sig.P) : S with module G = G
  (** Persistent Graphs Builders *)

module I(G : Sig.I) : S with module G = G
  (** Imperative Graphs Builders *)
