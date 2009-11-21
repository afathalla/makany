class CourseCodesController < ApplicationController
  before_filter :require_person

  # GET /course_codes
  # GET /course_codes.xml
  def index
    @course_codes = CourseCode.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_codes }
    end
  end

  # GET /course_codes/1
  # GET /course_codes/1.xml
  def show
    @course_code = CourseCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_code }
    end
  end

  # GET /course_codes/new
  # GET /course_codes/new.xml
  def new
    @course_code = CourseCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_code }
    end
  end

  # GET /course_codes/1/edit
  def edit
    @course_code = CourseCode.find(params[:id])
  end

  # POST /course_codes
  # POST /course_codes.xml
  def create
    @course_code = CourseCode.new(params[:course_code])

    respond_to do |format|
      if @course_code.save
        flash[:notice] = 'CourseCode was successfully created.'
        format.html { redirect_to(@course_code) }
        format.xml  { render :xml => @course_code, :status => :created, :location => @course_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_codes/1
  # PUT /course_codes/1.xml
  def update
    @course_code = CourseCode.find(params[:id])

    respond_to do |format|
      if @course_code.update_attributes(params[:course_code])
        flash[:notice] = 'CourseCode was successfully updated.'
        format.html { redirect_to(@course_code) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_codes/1
  # DELETE /course_codes/1.xml
  def destroy
    @course_code = CourseCode.find(params[:id])
    @course_code.destroy

    respond_to do |format|
      format.html { redirect_to(course_codes_url) }
      format.xml  { head :ok }
    end
  end
end
