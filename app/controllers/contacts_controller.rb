class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @all_first_names = Contact.select(:first_name).distinct.order("first_name ASC")
    @all_last_names = Contact.select(:last_name).distinct.order("last_name ASC")
    @contacts = Contact.first_name_search(params[:first_name_search])
    if params[:first_name_search]
    @contacts = Contact.first_name_search(params[:first_name_search]).order("first_name ASC")
    elsif params[:last_name_search]
    @contacts = Contact.last_name_search(params[:last_name_search]).order("last_name ASC")
  else
    @contacts = Contact.all.order('created_at DESC')
  end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    if(params[:contact][:first_name].nil?)
      flash[:error] = "First name should not be blank.\n"
    end

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

def remove_all
  Contact.delete_all
  flash[:notice] = "You have removed all results!"
  redirect_to contacts_path
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone)
    end
end
