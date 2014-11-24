require 'rho/rhocontroller'
require 'helpers/browser_helper'

class InstallationController < Rho::RhoController
  include BrowserHelper

  # GET /Installation
  def index
    #@installations = Installation.find(:all)
    Rho::Installationmanager.process("/enterprise/user/",url_for(:action => :installationProcessCallback))
    render :back => '/app'
  end

  def installationProcessCallback
    puts "MALAYA #{@params.inspect}"
    Webview.Navigate("/app")
  end

  # GET /Installation/{1}
  def show
    @installation = Installation.find(@params['id'])
    if @installation
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Installation/new
  def new
    @installation = Installation.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Installation/{1}/edit
  def edit
    @installation = Installation.find(@params['id'])
    if @installation
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Installation/create
  def create
    @installation = Installation.create(@params['installation'])
    redirect :action => :index
  end

  # POST /Installation/{1}/update
  def update
    @installation = Installation.find(@params['id'])
    @installation.update_attributes(@params['installation']) if @installation
    redirect :action => :index
  end

  # POST /Installation/{1}/delete
  def delete
    @installation = Installation.find(@params['id'])
    @installation.destroy if @installation
    redirect :action => :index  
  end
end
