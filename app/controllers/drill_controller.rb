# -*- coding: utf-8 -*-
class DrillController < ApplicationController
  def index
    @ip = RandomIPAddr.new
    cookies[:network] = { :value => @ip.first }
    cookies[:broadcast] = { :value => @ip.last }
  end

  def result
    @answer = {}
    if (params[:network] == cookies[:network])
      @answer[:network] = {
        :mes => "OK."
      }
    else
      @answer[:network] = {
        :mes => "BAD.",
        :answer => "　Answer: #{ cookies[:network] }"
      }
    end

    if (params[:broadcast] == cookies[:broadcast])
      @answer[:broadcast] = {
        :mes => "OK."
      }
    else
      @answer[:broadcast] = {
        :mes => "BAD.",
        :answer => "　Answer: #{ cookies[:broadcast] }"
      }
    end

    @ip = RandomIPAddr.new
    cookies[:network] = { :value => @ip.first }
    cookies[:broadcast] = { :value => @ip.last }

    render
  end
end
