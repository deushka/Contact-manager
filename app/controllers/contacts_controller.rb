class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    if logged_in?
      @contacts = @current_user.contacts.all
    else
      redirect_to root_url
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    if !(logged_in?)
      redirect_to root_path
    elsif @current_user.contacts.find_by(id: params[:id]).nil?
      redirect_to root_url
    end
  end

  # GET /contacts/new
  def new
    if logged_in?
      @contact = Contact.new
    else
      redirect_to root_path
    end
  end

  # GET /contacts/1/edit
  def edit
    if !(logged_in?)
      redirect_to root_path
    elsif @current_user.contacts.find_by(id: params[:id]).nil?
      redirect_to root_url
    end
  end

  # POST /contacts
  # POST /contacts.json
  def create
    logged_in?
    @contact = @current_user.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    logged_in?
    if @current_user.id == @contact.user_id
      respond_to do |format|
        if @contact.update(contact_params)
          format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
          format.json { render :show, status: :ok, location: @contact }
        else
          format.html { render :edit }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    logged_in?
    if @current_user.id == @contact.user_id
      @contact.destroy
      respond_to do |format|
        format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :surname, :email, :phone, :optional)
    end
end
